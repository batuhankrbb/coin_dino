import 'package:flutter/material.dart';

import 'custom_colors.dart';

/*
  Color lightGreen = Color(0xFF71C03E);
  Color darkGreen = Color(0xFF4CAF0B);
  Color white = Color(0xFFFFFFFF);
  Color black = Color(0xFF3B3B3B);
  Color darkGrey = Color(0xFF4C4C4C);
  Color lightGrey = Color(0xFF939393);
  Color textGrey = Color(0xFF545454);
  Color creamyWhite = Color(0xFFF9F9F7);
  Color red = Color(0xFFED505F);
  Color pink = Color(0xFFE65E8B);
*/
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
      errorColor: CustomColor.shared.red,
      bottomAppBarColor: CustomColor.shared.darkGrey,
      colorScheme: ColorScheme(
        primary: CustomColor.shared.black,
        primaryVariant: CustomColor.shared.creamyWhite,
        secondary: CustomColor.shared.darkGreen,
        secondaryVariant: CustomColor.shared.darkGrey,
        surface: CustomColor.shared.lightGreen,
        background: CustomColor.shared.lightGrey,
        error: CustomColor.shared.pink,
        onPrimary: CustomColor.shared.red,
        onSecondary: CustomColor.shared.textGrey,
        onSurface: CustomColor.shared.white,
        brightness: Brightness.light,
        onError: Colors.red,
        onBackground: Colors.white,
      ),);

  ThemeData get lightModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.backgroundWhiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.backgroundWhiteColor,
          elevation: 0,
          centerTitle: true,
        ),
        colorScheme: ColorScheme(
        primary: CustomColor.shared.black,
        primaryVariant: CustomColor.shared.creamyWhite,
        secondary: CustomColor.shared.darkGreen,
        secondaryVariant: CustomColor.shared.darkGrey,
        surface: CustomColor.shared.lightGreen,
        background: CustomColor.shared.lightGrey,
        error: CustomColor.shared.pink,
        onPrimary: CustomColor.shared.red,
        onSecondary: CustomColor.shared.textGrey,
        onSurface: CustomColor.shared.white,
        brightness: Brightness.light,
        onError: CustomColor.shared.orange,
        onBackground: CustomColor.shared.lightOrange,
      ),
      );
}
