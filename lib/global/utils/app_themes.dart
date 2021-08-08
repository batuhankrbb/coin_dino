import 'package:flutter/material.dart';

import 'custom_colors.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
class AppThemes {
  AppThemes._();

  static final AppThemes _appThemesInstance = AppThemes._();

  factory AppThemes() {
    return _appThemesInstance;
  }

  ThemeData get darkModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.backgroundDarkModeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.backgroundDarkModeColor,
          elevation: 0,
          centerTitle: true,
        ),
      );

  ThemeData get lightModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.backgroundWhiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.backgroundWhiteColor,
          elevation: 0,
          centerTitle: true,
        ),
      );
}
