import 'package:flutter/material.dart';

extension CustomSize on BuildContext {
  double dynamicHeight(double ratio) => MediaQuery.of(this).size.height * ratio;

  double dynamicWidth(double ratio) => MediaQuery.of(this).size.width * ratio;
}

extension CustomTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get errorColor => Theme.of(this).colorScheme.onError;
}

extension CustomPadding on BuildContext {
  double get padding2 => 2;
  double get padding4 => 4;
  double get padding6 => 6;
  double get padding8 => 8;
  double get padding10 => 10;
  double get padding12 => 12;
  double get padding16 => 16;
  double get padding20 => 20;
  double get padding24 => 24;
  double get padding26 => 26;
  double get padding30 => 30;
  double get padding32 => 32;
  double get padding40 => 40;
  double get padding64 => 64;
  double customPadding(double padding) => padding;
}


