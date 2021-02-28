import 'package:flutter/material.dart';
import 'package:rss_reader/Screens/categories.dart';
import 'package:rss_reader/Screens/daily.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //Map map = Map<String, bool>();
  //Map map = {'Night Mode': false, 'one': false, 'two': true};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFFfcfcfc), accentColor: Colors.black),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Color(0xFFfcfcfc),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xFFfcfcfc),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
              body: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Got clicked in settings");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Categories()),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                      title: Text(
                        "Categories",
                        style: TextStyle(
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.w600,
                          //fontSize: 14),
                        ),
                      ),
                      //leading: Icon(Icons.lightbulb_outline),
                      trailing: Icon(
                        Icons.list_alt,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //isThreeLine: true,

                  //dense: true,

                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                    title: Text(
                      "Night Mode",
                      style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w600,
                        //fontSize: 14),
                      ),
                    ),
                    //leading: Icon(Icons.lightbulb_outline),
                    trailing: GestureDetector(
                      onTap: () {
                        print("Got clicked");
                      },
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.black,
                      ),
                    ),
                    //isThreeLine: true,

                    //dense: true,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    title: Text(
                      "Enable Javascript",
                      style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w600,
                        //fontSize: 14),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        print("Got clicked");
                      },
                      child: Icon(Icons.subtitles_off_outlined,
                          color: Colors.black),
                    ),
                    //isThreeLine: true,

                    //dense: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Got clicked in settings");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyNotification()),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      title: Text(
                        "Notification Schedule",
                        style: TextStyle(
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.w600,
                          //fontSize: 14),
                        ),
                      ),
                      trailing: Icon(Icons.notifications_active_outlined,
                          color: Colors.black),
                      //isThreeLine: true,

                      //dense: true,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    title: Text(
                      "About Us",
                      style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w600,
                        //fontSize: 14),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        print("Got clicked");
                      },
                      child: Icon(Icons.perm_identity_outlined,
                          color: Colors.black),
                    ),
                    //isThreeLine: true,

                    //dense: true,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
