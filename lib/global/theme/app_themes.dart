
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../utils/custom_colors.dart';

class AppThemes {
  static final shared = AppThemes._privateConstructor();

  AppThemes._privateConstructor();

 ThemeData get darkModeTheme => ThemeData(
        scaffoldBackgroundColor: CustomColor.shared.white,
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColor.shared.white,
          elevation: 0,
          centerTitle: true,
        ),
        buttonColor: Colors.blue,
        colorScheme: ColorScheme(
          primary: CustomColor.shared.black,
          primaryVariant: CustomColor.shared.black,
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
