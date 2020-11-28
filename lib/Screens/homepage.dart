import 'package:flutter/material.dart';
import 'package:rss_reader/Screens/settingspage.dart';
//import 'package:webfeed/domain/media/media.dart';
import 'newstab.dart';
import 'favoritestab.dart';
//import 'topicpage.dart';

//font
//color
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      theme:
          ThemeData(primaryColor: Color(0xFFfcfcfc), accentColor: Colors.black),
      home: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return hello(context);
          } else {
            return hello2(context);
          }
        },
      ),
    ));
  }
}

Widget hello(context) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                print("Cool");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: Icon(Icons.settings),
            ),
          ),
        ],
        title: Text(
          "ReadPencil",
          style: TextStyle(
              fontFamily: 'Spartan',
              fontWeight: FontWeight.w900,
              color: Colors.black),
        ),
        backgroundColor: Color(0xFFf2f2f2),
        bottom: TabBar(
          //isScrollable: true,

          tabs: [
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.rss_feed,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "News",
                    style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Favorites",
                    style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          News(),
          Favorites(),
        ],
      ),
    ),
  );
}

Widget hello2(context) {
  return Scaffold(
    backgroundColor: Color(0xFFf2f2f2),
    appBar: AppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              print("Cool");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            child: Icon(Icons.settings),
          ),
        ),
      ],
      title: Text(
        "ReadPencil",
        style: TextStyle(
            fontFamily: 'Spartan',
            fontWeight: FontWeight.w900,
            color: Colors.black),
      ),
      backgroundColor: Color(0xFFf2f2f2),
    ),
    body: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: News(),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Favorites(),
        ),
      ],
    ),
  );
}
