import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../utils/custom_colors.dart';

class AppThemes {
  static final shared = AppThemes._privateConstructor();

  AppThemes._privateConstructor();

  ThemeData get darkModeTheme => ThemeData(
      scaffoldBackgroundColor: Color(0xFF252525),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF4C4C4C),
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.light
      ),
      buttonColor: Colors.blue,
      colorScheme: ColorScheme(
        primary: CustomColor.shared.white,
        primaryVariant: Color(0xFF5D5E5D),
        secondary: CustomColor.shared.darkGreen,
        secondaryVariant: Color(0xFF4C4C4C),
        surface: CustomColor.shared.lightGreen,
        background: CustomColor.shared.lightGrey,
        error: CustomColor.shared.pink,
        onPrimary: CustomColor.shared.red,
        onSecondary: CustomColor.shared.textGrey,
        onSurface: CustomColor.shared.black,
        brightness: Brightness.light,
        onError: Color(0xFF5D5E5D),
        onBackground: CustomColor.shared.creamyWhite,
      ),
      dividerColor: CustomColor.shared.lightGrey,
      cardColor: CustomColor.shared.darkerWhite,
      hintColor: CustomColor.shared.white,
      selectedRowColor: CustomColor.shared.black,
      accentColor: CustomColor.shared.creamyWhite,
      primaryColor: CustomColor.shared.creamyWhite,secondaryHeaderColor: Color(0xFF5D5E5D),disabledColor: CustomColor.shared.lightGrey);

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
        onBackground: CustomColor.shared.darkGrey,
      ),
      cardColor: CustomColor.shared.darkGrey,
      hintColor: CustomColor.shared.white,
      selectedRowColor: CustomColor.shared.black,
      accentColor: CustomColor.shared.darkGrey,
      primaryColor: CustomColor.shared.darkGrey,secondaryHeaderColor: CustomColor.shared.backgroundBlueColor,disabledColor: CustomColor.shared.black);
}
