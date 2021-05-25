import 'package:flutter/material.dart';

import '../utils/device_enums.dart';
import '../utils/responsive_layout_helper.dart';

class DeterminerWidget extends StatelessWidget {
  final Widget portraitMobile;
  final Widget? landscapeMobile;
  final Widget? portraitTablet;
  final Widget? landscapeTablet;
  final Widget? desktop;
  late final ResponsiveLayoutHelper _helper;
  late final CustomDeviceType _customDeviceType;
  late final Orientation _orientation;

  DeterminerWidget({
    Key? key,
    required this.portraitMobile,
    this.landscapeMobile,
    this.portraitTablet,
    this.landscapeTablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _helper = ResponsiveLayoutHelper(context: context);
    _customDeviceType = _helper.getCustomDeviceType();
    _orientation = _helper.getOrientation();

    var desktop = _desktopControl();
    var tablet = _tabletControl();
    var mobile = _mobileControl();

    if (desktop != null) {
      return desktop;
    }

    if (tablet != null) {
      return tablet;
    }

    return mobile;
  }

  Widget _mobileControl() {
    if (_orientation == Orientation.landscape && landscapeMobile != null) {
      return landscapeMobile!;
    }
    return portraitMobile;
  }

  Widget? _tabletControl() {
    if (_customDeviceType == CustomDeviceType.tablet) {
      //You can use ?? to shorten the code but I didn't because I may need to add extra controls like platform control in the future.
      if (_orientation == Orientation.landscape && landscapeTablet != null) {
        return landscapeTablet;
      }
      return portraitTablet;
    }
  }

  Widget? _desktopControl() {
    if (_customDeviceType == CustomDeviceType.desktop) {
      return desktop;
    }
  }
}
