import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:rss_reader/main.dart';

class NewsClass {
  String headline;
  String url;
  String author;

  NewsClass(this.headline, this.url, this.author);
}

Set<NewsClass> newsList = {};

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

bool withinDateOrNot(DateTime day) {
  var now = new DateTime.now();
  DateTime yesterday = now.subtract(Duration(hours: 120));
  if (yesterday.difference(day).inHours > 0) {
    return false;
  } else {
    return true;
  }
}

engine() async {
  List getSiteList = await siteList();
  print(getSiteList.length);
  var client = http.Client();

  for (int i = 0; i < getSiteList.length; i++) {
    print("fillList Initialized");
    var response = await client.get(getSiteList[i]);
    var channel = RssFeed.parse(response.body);
    classify(channel);
  }

  //client.close();
  //print(tempList);
  return newsList;
}
// ,
//     'https://blog.mozilla.org/feed',
//     'https://www.theguardian.com/world/zimbabwe/rss',
//     'https://www.theguardian.com/uk/rss'

/* ORIGINAL SITElIST
siteList() {
  List<String> siteList = [
    'https://www.nasa.gov/rss/dyn/breaking_news.rss',
    'https://omgubuntu.co.uk/rss',
    'https://www.theguardian.com/uk/rss'
  ];
  return siteList;
}
*/
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/sites.txt');
}

siteList() {
  List<String> siteList = [
    'https://www.nasa.gov/rss/dyn/breaking_news.rss',
    'https://omgubuntu.co.uk/rss',
    'https://www.theguardian.com/uk/rss'
  ];
  return siteList;
}

isEmpty() {
  if (newsList == null) {
    return null;
  }
}

classify(RssFeed feed) async {
  newsList = {};
  for (int i = 0; i < feed.items.length; i++) {
    final item = feed.items[i];

    if (withinDateOrNot(item.pubDate)) {
      String author = item.dc.creator;
      String url = item.link;
      String headline = item.title;
      NewsClass news = new NewsClass(
        headline,
        url,
        author,
      );
      newsList.add(news);
    }
  }
}

Future getProjectDetails() async {
  var result = await engine();

  return result;
}

class _NewsState extends State<News> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          key: UniqueKey(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return list();
            }
          },
          future: getProjectDetails(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.replay_outlined),
          onPressed: () {
            setState(() {
              print(newsList);
              list();
              newsList = {};
            });
          },
        ),
      ),
    );
  }
}

list() {
  return ListView.separated(
    itemCount: newsList.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        onTap: () {
          print("Hello");
          loadBrowser(newsList.elementAt(index).url);
        },
        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        title: Text(
          newsList.elementAt(index).headline,
          style: TextStyle(
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
        subtitle: Text(
          newsList.elementAt(index).author,
          style: TextStyle(
            fontFamily: 'Merriweather',

            fontWeight: FontWeight.w600,
            //color: Colors.black
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            print("Love");
          },
          child: Icon(Icons.favorite_border_rounded),
        ),
        //isThreeLine: true,

        dense: true,
      );
    },
    separatorBuilder: (BuildContext context, int index) => Divider(height: 5),
  );
}

Future<void> loadBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
      enableDomStorage: true,
    );
  } else {
    print("Could not launch");
  }
}
