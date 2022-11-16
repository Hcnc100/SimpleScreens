import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primaryColor = Colors.indigo;

  static ThemeData lightTheme = ThemeData.light().copyWith(
      // * define colors
      primaryColor: primaryColor,
      // * app bar theme
      appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),
      // * text button theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryColor)),
      // * floating action button theme
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primaryColor),
      // * elevation button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: const StadiumBorder(),
              elevation: 0)));
}
