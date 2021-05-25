import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
extension MaterialExtensions on ThemeData {
  static ThemeData get darkModeTheme => ThemeData(
      scaffoldBackgroundColor: CustomColor.shared.backgroundDarkModeColor,
      appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.backgroundDarkModeColor,
          elevation: 0));
  static ThemeData get lightModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.backgroundWhiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.backgroundWhiteColor,
          elevation: 0,
          centerTitle: true,
        ),
      );
}
