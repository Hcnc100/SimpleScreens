import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primaryColor = Colors.indigo;

  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryColor)));
}
