import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFF6F61); // Coral Orange
  static const Color secondaryColor = Color(0xFFFFB74D); // Warm Gold
  static const Color backgroundColor = Color(0xFFF4F6FF); // Soft Blue Tint
  
  // Add new color properties
  static const Color tertiaryColor = Color(0xFF5DADE2); // Lighter blue from previous color scheme
  static const Color errorColor = Color(0xFFFF4757); // Vibrant red for error states

  // Add text styles for profile screen
  static TextStyle profileTitleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static TextStyle profileSubtitleStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static TextStyle listTileTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'ProductSans', // Keep ProductSans as primary font
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
      bodyLarge: TextStyle(
          fontSize: 18, color: Colors.black, decoration: TextDecoration.none),
      bodyMedium: TextStyle(
          fontSize: 16, color: Colors.black54, decoration: TextDecoration.none),
      bodySmall: TextStyle(
          fontSize: 14, color: Colors.black54, decoration: TextDecoration.none),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'ProductSans',
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.none),
      bodyLarge: TextStyle(
          fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
      bodyMedium: TextStyle(
          fontSize: 16, color: Colors.white70, decoration: TextDecoration.none),
      bodySmall: TextStyle(
          fontSize: 14, color: Colors.white70, decoration: TextDecoration.none),
    ),
  );
}
