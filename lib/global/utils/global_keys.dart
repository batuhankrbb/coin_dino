import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlobalKeys {
  static var shared = GlobalKeys._privateConstructor();

  GlobalKeys._privateConstructor();

  var scaffoldKey = GlobalKey<ScaffoldState>();
}

