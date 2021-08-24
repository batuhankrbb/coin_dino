import 'package:coin_dino/global/theme.dart';
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

  AppTheme get redAppTheme => AppTheme(
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.white),
        themeSettingsScreen: ThemeSettingsScreen(appBarColor: Colors.white),
        themeSearchScreen: ThemeSearchScreen(appBarColor: Colors.white),
        themeOnboardScreen: ThemeOnboardScreen(appBarColor: Colors.white),
        themeInAppPurchaseScreen:
            ThemeInAppPurchaseScreen(appBarColor: Colors.white),
        themeHomeScreen: ThemeHomeScreen(appBarColor: Colors.white),
        themeDetailScreen: ThemeDetailScreen(appBarColor: Colors.white),
        themeAlertListScreen: ThemeAlertListScreen(appBarColor: Colors.white),
        themeAlertDetailScreen:
            ThemeAlertDetailScreen(appBarColor: Colors.white),
      );

  AppTheme get yellowAppTheme => AppTheme(
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.white),
        themeSettingsScreen: ThemeSettingsScreen(appBarColor: Colors.white),
        themeSearchScreen: ThemeSearchScreen(appBarColor: Colors.white),
        themeOnboardScreen: ThemeOnboardScreen(appBarColor: Colors.white),
        themeInAppPurchaseScreen:
            ThemeInAppPurchaseScreen(appBarColor: Colors.white),
        themeHomeScreen: ThemeHomeScreen(appBarColor: Colors.white),
        themeDetailScreen: ThemeDetailScreen(appBarColor: Colors.white),
        themeAlertListScreen: ThemeAlertListScreen(appBarColor: Colors.white),
        themeAlertDetailScreen:
            ThemeAlertDetailScreen(appBarColor: Colors.white),
      );

  AppTheme get darkAppTheme => AppTheme(
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.white),
        themeSettingsScreen: ThemeSettingsScreen(appBarColor: Colors.white),
        themeSearchScreen: ThemeSearchScreen(appBarColor: Colors.white),
        themeOnboardScreen: ThemeOnboardScreen(appBarColor: Colors.white),
        themeInAppPurchaseScreen:
            ThemeInAppPurchaseScreen(appBarColor: Colors.white),
        themeHomeScreen: ThemeHomeScreen(appBarColor: Colors.white),
        themeDetailScreen: ThemeDetailScreen(appBarColor: Colors.white),
        themeAlertListScreen: ThemeAlertListScreen(appBarColor: Colors.white),
        themeAlertDetailScreen:
            ThemeAlertDetailScreen(appBarColor: Colors.white),
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
