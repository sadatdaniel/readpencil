import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import '../Functionality/shownotifications.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DailyNotification extends StatefulWidget {
  @override
  _DailyNotificationState createState() => _DailyNotificationState();
}

class _DailyNotificationState extends State<DailyNotification> {
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AndroidAlarmManager.oneShotAt(
        DateTime.now().add(Duration(seconds: 5)), 0, ShowNotification,
        exact: true,
        allowWhileIdle: true,
        wakeup: true,
        rescheduleOnReboot: true,
        alarmClock: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: new Container(
          padding: EdgeInsets.only(top: 100),
          child: new Column(
            children: <Widget>[
//            hourMinute12H(),
              Center(child: hourMinute12H()),
//            hourMinuteSecond(),
//            hourMinute12HCustomStyle(),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: new Text(
                  _dateTime.hour.toString().padLeft(2, '0') +
                      ':' +
                      _dateTime.minute.toString().padLeft(2, '0') +
                      ':' +
                      _dateTime.second.toString().padLeft(2, '0'),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Click Me",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                onPressed: () async {
                  print("Okay");
                  // await AndroidAlarmManager.initialize();
                  await AndroidAlarmManager.oneShot(
                      const Duration(seconds: 30), 0, ShowNotification);
                },
              )
            ],
          ),
        ));
  }

  Widget hourMinute12H() {
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w400,
          color: Colors.black),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Spartan',
          fontWeight: FontWeight.w900,
          color: Colors.black),
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  void ShowNotification() {
    final DateTime now = DateTime.now();
    LocalNotification.Initializer();
    LocalNotification.ShowOneTimeNotification(DateTime.now());
  }
}
