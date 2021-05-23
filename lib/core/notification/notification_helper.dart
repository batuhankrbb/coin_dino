import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final shared = NotificationHelper();
  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails("1", 'coin', 'coin alert',
          importance: Importance.max,
          showProgress: true,
          priority: Priority.high,
          channelShowBadge: true,
          playSound: true,
          showWhen: false);
  static const IOSNotificationDetails iosNotificationDetails =
      IOSNotificationDetails(
          badgeNumber: 2,
          presentSound: true,
          presentAlert: true,
          presentBadge: true);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification({String? andoridIcon}) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print(payload);
  }

  Future onSelectNotification(String? payload) async {
    print(payload);
  }

  void showNotification(
      {int? channelID,
      required String title,
      required String description,
      required String payLoad}) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        channelID ?? 1, title, description, platformChannelSpecifics,
        payload: payLoad);
  }

  void showPeriodicNotification(
      {RepeatInterval? repeatInterval,
      required int periodicNotifChannelID,
      required String periodicTitle,
      required String periodicDescription,
      required String periodicPayloads}) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        periodicNotifChannelID,
        periodicTitle,
        periodicDescription,
        repeatInterval ?? RepeatInterval.daily,
        platformChannelSpecifics,
        payload: periodicPayloads);
  }
}
