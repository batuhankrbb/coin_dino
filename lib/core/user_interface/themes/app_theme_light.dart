import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class AppThemeLight {


  CustomColor _customColor = CustomColor();

 static AppThemeLight shared = AppThemeLight();

  ThemeData get theme => ThemeData.light().copyWith(
      colorScheme: ColorScheme.light().copyWith(
          primary: _customColor.black,
          secondary: _customColor.white,
          onError: _customColor.red),
      scaffoldBackgroundColor: _customColor.black,
      backgroundColor: _customColor.black,
      textTheme: ThemeData.light().textTheme.apply(fontFamily: "Helvetica"),
      primaryTextTheme:
          ThemeData.light().textTheme.apply(fontFamily: "Helvetica"),
      accentTextTheme:
          ThemeData.light().textTheme.apply(fontFamily: "Helvetica"));
}
