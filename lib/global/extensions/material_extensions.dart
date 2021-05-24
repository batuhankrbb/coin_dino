import 'package:flutter/material.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
extension MaterialExtensions on ThemeData {
  static ThemeData get darkModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.red
  );
   static ThemeData get lightModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.black
  );
}

