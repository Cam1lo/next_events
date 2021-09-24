import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  //Instant Notifications
  Future instantNotification() async {
    var android = AndroidNotificationDetails("id", "channel", "description");

    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo instant notification", "Tap to do something", platform,
        payload: "Welcome to demo app");
  }

  //Scheduled Notification
  Future scheduledNotification(DateTime date, String title, String text) async {
    tz.initializeTimeZones();

    var tzDateTime = tz.TZDateTime.from(date, tz.getLocation('America/Havana'));

    var android = AndroidNotificationDetails("id", "channel", "description");

    var platform = new NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        text,
        tzDateTime,
        platform, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  //Cancel notification

  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}