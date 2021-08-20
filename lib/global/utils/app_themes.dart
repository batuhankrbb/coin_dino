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
  static final shared = AppThemes._privateConstructor();

  AppThemes._privateConstructor();

  ThemeData get newTheme => ThemeData(
      colorScheme: ColorScheme(
        primary: Colors.white, //* Bottom Tab Bar Selected
        primaryVariant: Colors.white, //* Bottom Tab Bar Unselected
        secondary: Colors.white, //* Tab Bar Selected
        secondaryVariant: Colors.white, //* Tab Bar Unselected
        surface: Colors.white, //* Tab Bar Background
        background: Colors.white, //* App Bar Background,
        error: Colors.white, //* App Bar Icon,
        onPrimary: Colors.white, //* App Bar Title,
        onSecondary: Colors.white, //* Icon Color
        onSurface: Colors.white, //* Icon Background Color,
        onBackground: Colors.white, //* Secondary Icon Color,
        onError: Colors.white, //* Secondary Icon Background Color,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white, //* BackgroundColor
      backgroundColor: Colors.white, //* Secondary Background Color
      errorColor: Colors.white, //* Positive Background Color
      hintColor: Colors.white, //* Negative Background Color
      dividerColor: Colors.white, //* Divider Color
      cardColor: Colors.white, //* Header Background
      secondaryHeaderColor: Colors.white, //* TextField Background
      buttonColor: Colors.white, //* Button Background Color,
      canvasColor: Colors.white, //* Secondary Button Background Color
      disabledColor: Colors.white, //* Button Text Color
      primaryColor: Colors.white, //* Positive Text Color,
      highlightColor: Colors.white, //* Negative Text Color
      shadowColor: Colors.white, //* Link Text Color
      accentColor: Colors.white, //* Normal Text Color
      splashColor: Colors.white, //* Secondary Text Color
      hoverColor: Colors.white //* Execution Text Color
      );

  ThemeData get darkModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.white,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.white,
          elevation: 0,
          centerTitle: true,
        ),
        buttonColor: Colors.blue,
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
          onError: CustomColor.shared.darkerWhite,
          onBackground: Colors.white,
        ),
      );

  ThemeData get lightModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.white,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.white,
          elevation: 0,
          centerTitle: true,
        ),
        buttonColor: Colors.blue,
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
          onError: CustomColor.shared.darkerWhite,
          onBackground: CustomColor.shared.lightOrange,
        ),
      );
}
