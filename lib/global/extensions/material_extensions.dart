
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
extension MaterialExtensions on ThemeData {
  static ThemeData get darkModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: AppBarTheme(backgroundColor: CustomColor.shared.backgroundWhiteColor,elevation: 0)
  );
   static ThemeData get lightModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.yellow
  );
}

