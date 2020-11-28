import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  //Map map = Map<String, bool>();
  Map map = {'Night Mode': false, 'one': false, 'two': true};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xFFfcfcfc), accentColor: Colors.black),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xFFf2f2f2),
            appBar: AppBar(
              title: Text(
                "Topics",
                style: TextStyle(
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            body: ListView.separated(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                  title: Text(
                    "Night Mode",
                    style: TextStyle(
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w400,
                      //fontSize: 14),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      print("Got clicked");
                    },
                    child: Icon(Icons.favorite_border_rounded),
                  ),
                  //isThreeLine: true,

                  //dense: true,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 1),
            ),
          ),
        ),
      ),
    );
  }
}
