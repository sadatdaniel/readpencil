import 'dart:convert';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'Screens/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';
import 'Functionality/shownotifications.dart';
import 'package:http/http.dart' as http;

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('sites');
  var initValue = await Hive.openBox('categories');
  initValue.put("categories", "['World Politics']");

  Workmanager.initialize(callbackDispatcher);
  Workmanager.registerPeriodicTask("check_for_new", "taskName",
      frequency: Duration(
          minutes:
              15), //android does not allow (most probably) more frequent than 15 minutes
      initialDelay: Duration(minutes: 1),
      inputData: {"data1": "value1", "data2": "value2"});
  // await updateSiteList().then((value) {
  //   print(value);
  // });
  // print(siteList);
  await AndroidAlarmManager.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

void callbackDispatcher() {
  Workmanager.executeTask((taskName, inputData) {
    printSomething();
    updateSiteList();
    LocalNotification.Initializer();
    LocalNotification.ShowOneTimeNotification(DateTime.now());
    return Future.value(true);
  });
}

void printSomething() async {
  print("PRINTING SOMETHING EVERY 15 MINUTES");
}

updateSiteList() async {
  var box = await Hive.openBox('sites');
  var box1 = await Hive.openBox('categories');
  var boxValue = box1.get('categories');
  if (box.isEmpty) {
    final response = await http
        .get("https://finalredpencil.herokuapp.com/?subscribed=$boxValue");
    if (response.statusCode == 200) {
      // print("Got Info from API");
      var decoded = jsonDecode(response.body);
      box.put('sites', decoded);
      // print('${box.get('sites')}');
      print(decoded.toString());
      print('Printing SiteList from Main $decoded');

      return box.get('sites');
    }
  } else {
    // print("Box is not empty");
    // print('${box.get('sites')}');
    return box.get('sites');
  }
}
