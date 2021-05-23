import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/background/background_helper.dart';
import 'core/notification/notification_helper.dart';


void main() async {
  runApp(new MyApp());

  BackgroundHelper.shared.initializeBackground(() {
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
        actions: <Widget>[]);
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
        child: Row(children: <Widget>[
      Container(child: Text(""), margin: EdgeInsets.only(left: 20.0))
    ]));
  }

  Container buildBody() {
    return Container(
      color: Colors.black,
      child: new ListView.builder(
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {

            return InputDecorator(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 0.0),
                    labelStyle:
                        TextStyle(color: Colors.amberAccent, fontSize: 20.0),
                    labelText: "[background fetch event]"),
                child: new Text("",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)));
          }),
    );
  }
}
