import 'package:flutter/material.dart';

/// Material app ile alakalı tüm uzantılar buradan yönetiliyor.
extension MaterialExtensions on ThemeData {
  ThemeData get darkModeTheme => ThemeData(
    scaffoldBackgroundColor: Colors.red
  );
  ThemeData get lightModeTheme => ThemeData();
}
