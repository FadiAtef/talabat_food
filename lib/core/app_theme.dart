import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFFF55540);
  static const Color primaryLight = Color(0xFFFEEEEC);
  static const Color background = Color(0xFFF7F7F7);
  static const Color white = Colors.white;
  static const Color textDark = Colors.black;
  static const Color textMid = Color(0xFF555555);
  static const Color divider = Color(0xFFEEEEEE);

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    useMaterial3: true,
  );
}
