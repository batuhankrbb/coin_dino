import 'package:flutter/material.dart';

import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';

//TODO WILL BE UPDATED
class ThemeMainScreen {
  Color appBarColor;
  ThemeMainScreen({
    required this.appBarColor,
  });
}

class ThemeSettingsScreen {
  Color appBarColor;
  ThemeSettingsScreen({
    required this.appBarColor,
  });
}

class ThemeSearchScreen {
  Color appBarColor;
  ThemeSearchScreen({
    required this.appBarColor,
  });
}

class ThemeOnboardScreen {
  Color appBarColor;
  ThemeOnboardScreen({
    required this.appBarColor,
  });
}

class ThemeInAppPurchaseScreen {
  Color appBarColor;
  ThemeInAppPurchaseScreen({
    required this.appBarColor,
  });
}

class ThemeHomeScreen {
  Color appBarColor;
  ThemeHomeScreen({
    required this.appBarColor,
  });
}

class ThemeDetailScreen {
  Color appBarColor;
  ThemeDetailScreen({
    required this.appBarColor,
  });
}

class ThemeAlertListScreen {
  Color appBarColor;
  ThemeAlertListScreen({
    required this.appBarColor,
  });
}

class ThemeAlertDetailScreen {
  Color appBarColor;
  ThemeAlertDetailScreen({
    required this.appBarColor,
  });
}

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


//* Yöntem 1 -- AppThemes diye bir şey oluşturup AppThemeRed, AppThemeYellow gibi instanceler yapmak

//* Yöntem 2 -- AppThemes diye main bir sınıf sonra her property mesela mainAppBarColor falan fonksiyon olucak switch case yaparak renk döndürücek