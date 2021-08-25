import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final shared = NotificationHelper._privateConstructor();

  NotificationHelper._privateConstructor();

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails("1", 'coin', 'coin alert',
          importance: Importance.max,
          showProgress: true,
          priority: Priority.max,
          channelShowBadge: true,
          playSound: true,
          showWhen: false);

  IOSNotificationDetails _iosNotificationDetails = IOSNotificationDetails(
      presentSound: true, presentAlert: true, presentBadge: true);

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification({String? andoridIcon}) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future<void> _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print(payload);
  }

  Future<void> _onSelectNotification(String? payload) async {
    print(payload);
  }

  void showNotification(
      {int? channelID,
      required String title,
      required String description,
      required String payLoad}) async {
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: _androidNotificationDetails, iOS: _iosNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        channelID ?? 1, title, description, platformChannelSpecifics,
        payload: payLoad);
  }
}
