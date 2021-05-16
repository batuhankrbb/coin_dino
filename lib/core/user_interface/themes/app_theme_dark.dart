import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class AppThemeDark {
  CustomColor _customColor = CustomColor();

  static AppThemeDark shared = AppThemeDark();

  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark().copyWith(
          primary: _customColor.black,
          secondary: _customColor.white,
          onError: _customColor.red),
      scaffoldBackgroundColor: _customColor.black,
      backgroundColor: _customColor.black,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Helvetica"),
      primaryTextTheme:
          ThemeData.dark().textTheme.apply(fontFamily: "Helvetica"),
      accentTextTheme:
          ThemeData.dark().textTheme.apply(fontFamily: "Helvetica"));
}
