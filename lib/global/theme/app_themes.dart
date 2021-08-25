import 'package:coin_dino/global/theme/app_theme.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_alert_detail_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_alert_list_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_detail_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_home_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_inapp_purchase_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_main_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_onboard_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_search_screen.dart';
import 'package:coin_dino/global/theme/screen_themes/theme_settings_screen.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';


class AppThemes {
  static final shared = AppThemes._privateConstructor();

  AppThemes._privateConstructor();

  AppTheme get redAppTheme => AppTheme(
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.red),
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
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.yellow),
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
        themeMainScreen: ThemeMainScreen(appBarColor: Colors.black),
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

       AppTheme get lightAppTheme => AppTheme(
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
