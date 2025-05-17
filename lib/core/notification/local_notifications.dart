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


  //Todo BasicNotification
  static void showBasicNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 1',
      'basic notification',
      importance: Importance.max,
      priority: Priority.high
    ));
    await flutterLocalNotificationsPlugin.show(
        0, 
        'Elmanfy',
         'Add User Sucsess',
          details,
        payload: 'Payload Data');
  }
  //Todo RepeatedNotification
  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 2',
      'repeated notification',
      importance: Importance.max,
      priority: Priority.high
    ));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, 
        'Elmanfy',
         'Repeated Notification Sucsess',
         RepeatInterval.everyMinute,
          details,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle ,
        payload: 'Payload Data');
  }

  static void cacelNotification(int id)async{
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
