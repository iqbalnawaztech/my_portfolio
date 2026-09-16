import 'package:flutter/material.dart';

class AppTheme {
  // Main colors
  static const Color primary = Color(0xFF3B82F6);
  static const Color secondary = Color(0xFF22D3EE);

  // Background colors
  static const Color background = Color(0xFF0B1120);
  static const Color surface = Color(0xFF111827);

  // Text colors
  static const Color white = Color(0xFFF8FAFC);
  static const Color grey = Color(0xFF94A3B8);

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
      onPrimary: white,
      onSecondary: background,
      onSurface: white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: white,
      elevation: 0,
      centerTitle: false,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: secondary,
        side: const BorderSide(
          color: secondary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: white,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: grey,
      ),
      bodyMedium: TextStyle(
        color: grey,
      ),
    ),
  );
}