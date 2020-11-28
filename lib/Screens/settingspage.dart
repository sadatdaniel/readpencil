import 'package:flutter/material.dart';

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
                      "Notification Schedule",
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
                      child: Icon(Icons.notifications_active_outlined,
                          color: Colors.black),
                    ),
                    //isThreeLine: true,

                    //dense: true,
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
