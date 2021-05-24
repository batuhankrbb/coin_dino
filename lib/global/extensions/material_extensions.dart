
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/material.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
extension MaterialExtensions on ThemeData {
  static ThemeData get darkModeTheme => ThemeData(
    scaffoldBackgroundColor: CustomColor.shared.backgroundWhiteColor,
    appBarTheme: AppBarTheme(backgroundColor: CustomColor.shared.backgroundWhiteColor,elevation: 0)
  );
   static ThemeData get lightModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.black
  );
}

