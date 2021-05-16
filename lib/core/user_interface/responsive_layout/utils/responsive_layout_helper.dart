import 'dart:io';

import 'package:flutter/widgets.dart';

import 'device_enums.dart';
import 'screen_information_model.dart';

class ResponsiveLayoutHelper {
  final BuildContext context;

  MediaQueryData get mediaQueryData {
    return MediaQuery.of(context);
  }

  ResponsiveLayoutHelper({required this.context});

  CustomDeviceType getCustomDeviceType() {
    double deviceWidth = mediaQueryData.size.shortestSide;

    if (deviceWidth > 950) {
      return CustomDeviceType.desktop;
    }

    if (deviceWidth > 600) {
      return CustomDeviceType.tablet;
    }

    return CustomDeviceType.mobile;
  }

  Orientation getOrientation() {
    return mediaQueryData.orientation;
  }

  CustomDevicePlatform getPlatform() {
    if (Platform.isAndroid) {
      return CustomDevicePlatform.android;
    }
    if (Platform.isIOS) {
      return CustomDevicePlatform.ios;
    }
    if (Platform.isMacOS) {
      return CustomDevicePlatform.macos;
    }
    if (Platform.isWindows) {
      return CustomDevicePlatform.windows;
    }
    if (Platform.isLinux) {
      return CustomDevicePlatform.linux;
    }
    return CustomDevicePlatform.fuchsia;
  }

  Size getScreenSize() {
    return mediaQueryData.size;
  }

  ScreenInformation getAllInformations(
      {required BoxConstraints boxConstraints}) {
    return ScreenInformation(
      customDeviceType: getCustomDeviceType(),
      orientation: getOrientation(),
      screenSize: getScreenSize(),
      boundsSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
    );
  }
}
