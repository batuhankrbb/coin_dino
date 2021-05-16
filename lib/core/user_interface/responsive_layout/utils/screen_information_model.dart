import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'device_enums.dart';

class ScreenInformation {
  final CustomDeviceType customDeviceType;
  final Orientation orientation;
  final Size screenSize;
  final Size boundsSize;

  ScreenInformation(
      {required this.customDeviceType,
      required this.orientation,
      required this.screenSize,
      required this.boundsSize});

  @override
  String toString() {
    return "CustomDeviceType ${customDeviceType.toString()} | Orientation ${orientation.toString()} | ScreenSize ${screenSize.toString()} | BoundsSize ${boundsSize.toString()}";
  }
}