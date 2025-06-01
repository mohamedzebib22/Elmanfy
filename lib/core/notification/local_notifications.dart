import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsServices {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static Future<void> requestPermission() async {
    final androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    final granted = await androidImplementation
        ?.requestNotificationsPermission(); // يجب أن تكون موجودة
    print('🔔 Notification permission granted: $granted');
  }

  //Todo BasicNotification
  static void showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'basic notification',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(
        0, 'المنفى', 'اهلا بك يرجى مراجعة كامل الديون الموجوده ', details,
        payload: 'Payload Data');
  }

  //Todo RepeatedNotification
  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'repeated notification',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(1, 'Elmanfy',
        'Repeated Notification Sucsess', RepeatInterval.everyMinute, details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'Payload Data');
  }

  //Todo SchduledNotification
  static Future<void> showSchduledNotification({required int id,required String title, required String body}) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 3', 'Schduled notification',
            importance: Importance.max, priority: Priority.max));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    log('The currentTimeZone is :$currentTimeZone ');

    // final scheduledDate = tz.TZDateTime(tz.local, 2025, 5, 18, 13, 35);
    // final now = tz.TZDateTime.now(tz.local);
    //log('⏰ الساعة الحالية: ${now.hour}:${now.minute}:${now.second}');
    // if (scheduledDate.isBefore(now)) {
    //   log('❌ التاريخ المحدد في الماضي أو نفس اللحظة الحالية. يرجى تحديد وقت مستقبلي.');
    //   return;
    // }

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(days: 7)),
        details,
        androidScheduleMode: AndroidScheduleMode.inexact,
        payload: 'PayloodData');
  }

  static void cacelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
