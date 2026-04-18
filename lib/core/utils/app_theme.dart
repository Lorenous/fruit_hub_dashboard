import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  );
}
