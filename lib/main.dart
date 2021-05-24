import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/background/background_helper.dart';
import 'core/notification/notification_helper.dart';
import 'features/global/components/loading_screen_components.dart';

void main() async {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );

  BackgroundHelper.shared.initializeBackground(() {
    //TODO İleride viewmodel içinde kullanılacak şey: AlertRepository.checkAlerts();
    NotificationHelper.shared.showNotification(
        title: "fetch fonksiyonu",
        description: "fetch açıklama",
        payLoad: "fetch_payload");
  }, () {
    NotificationHelper.shared.showNotification(
        title: "timeout fonksiyonu",
        description: "timeout açıklama",
        payLoad: "timeout_payload");
  }, () {
    NotificationHelper.shared.showNotification(
        title: "headless fonksiyonu",
        description: "headless açıklama",
        payLoad: "headless_payload");
  });
  await BackgroundHelper.shared.startBackgroundFetch();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: LoadingScreen(),
    );
  }
}
