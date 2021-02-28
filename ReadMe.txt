1. As stated in the syllabus, your app is required to use services to achieve some background task. You can use your service for periodic web API accesses, but it is all up to you.(30pts)

Changes Made in Main.dart.

2. Your notification must be based on a scheduler such as android alarm manager, and there must be at least two functioning actions on the notification. Please, include a README file explaining when/how the notification is triggered. (40pts)


In the application there are two notification systems. One works when periodical function goes on (starting with 1 minute delay and every 15 minutes) and the other function works on the Settings menu > Notification Scheduler or Screens > daily.dart. This one in theory supposed to trigger at a certain time in future everyday, for now it only works for specific minutes or seconds. 

Your broadcast receiver must be registered for some specific events (you can use battery_info, connectivity, or some other plugin to receive broadcast messages) and receive some broadcast messages sent by the system. I leave it to you, but please mention that in the README file as well. (30pts)


Changes Made in homepage.dart.

The application can detect network changes sent by the system.
