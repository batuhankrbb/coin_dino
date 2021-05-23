import 'dart:async';
import 'package:coin_dino/core/background/background_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:background_fetch/background_fetch.dart';

// [Android-only] This "Headless Task" is run when the Android app
// is terminated with enableHeadless: true
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("Timeout İN Headless $taskId || TEST");
    BackgroundFetch.finish(taskId);
    return;
  }
  print("Headless Received $taskId || TEST");
  BackgroundFetch.finish(taskId);
}

void main() async{
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.io/testing/ for more info.
  runApp(new MyApp());

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  await BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  await BackgroundHelper().startBackgroundFetch();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _enabled = true;
  int _status = 0;
  List<DateTime> _events = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  //! BACKGROUND FETCHI INIT ETTİĞİMİZ VE AYARLARINI YAPTIĞIMIZ METOD
  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      print("EVENT HANDLER $taskId || TEST ---BURASI ÇALIŞIYOR HER 15 DK DA BİR");
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      print("Timeout $taskId || TEST");
      //! BURAYA EĞER YAPTIĞIMIZ İŞLEM TİMEOUT YERSE YAPILACAK ŞEY. BURADA DA FINISH KODU KESİN EKLİYORUZ
      BackgroundFetch.finish(taskId);
    });
  }

  void _onClickEnable(enabled) {}

  void _onClickStatus() async {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return new AppBar(
        title: const Text('BackgroundFetch Example',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,
        brightness: Brightness.light,
        actions: <Widget>[
          Switch(value: _enabled, onChanged: _onClickEnable),
        ]);
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
        child: Row(children: <Widget>[
      RaisedButton(onPressed: _onClickStatus, child: Text('Status')),
      Container(child: Text("$_status"), margin: EdgeInsets.only(left: 20.0))
    ]));
  }

  Container buildBody() {
    return Container(
      color: Colors.black,
      child: new ListView.builder(
          itemCount: _events.length,
          itemBuilder: (BuildContext context, int index) {
            DateTime timestamp = _events[index];
            return InputDecorator(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 0.0),
                    labelStyle:
                        TextStyle(color: Colors.amberAccent, fontSize: 20.0),
                    labelText: "[background fetch event]"),
                child: new Text(timestamp.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16.0)));
          }),
    );
  }
}
