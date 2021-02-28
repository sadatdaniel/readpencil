import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:rss_reader/Screens/settingspage.dart';
import 'newstab.dart';
import 'favoritestab.dart';
import 'package:connectivity/connectivity.dart';

//font
//color

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription connectivityStream;
  ConnectivityResult oldResult;

  @override
  void initState() {
    super.initState();
    connectivityStream = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resNow) {
      if (resNow == ConnectivityResult.none) {
        print("No Connection");
      } else if (oldResult == ConnectivityResult.none) {
        print("Connected");
      }
      oldResult = resNow;
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivityStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
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
          // isScrollable: true,

          tabs: [
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.rss_feed_sharp,
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

_showDialog(title, text, BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
  );
}
