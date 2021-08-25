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

import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';


class AppTheme {
  ThemeMainScreen themeMainScreen;
  ThemeSettingsScreen themeSettingsScreen;
  ThemeSearchScreen themeSearchScreen;
  ThemeOnboardScreen themeOnboardScreen;
  ThemeInAppPurchaseScreen themeInAppPurchaseScreen;
  ThemeHomeScreen themeHomeScreen;
  ThemeDetailScreen themeDetailScreen;
  ThemeAlertListScreen themeAlertListScreen;
  ThemeAlertDetailScreen themeAlertDetailScreen;

  AppTheme({
    required this.themeMainScreen,
    required this.themeSettingsScreen,
    required this.themeSearchScreen,
    required this.themeOnboardScreen,
    required this.themeInAppPurchaseScreen,
    required this.themeHomeScreen,
    required this.themeDetailScreen,
    required this.themeAlertListScreen,
    required this.themeAlertDetailScreen,
  });
}