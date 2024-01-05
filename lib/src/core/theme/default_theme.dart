// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  DefaultTheme._() {
    final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF313275),
      background: const Color(0xFFF8F8F8),
      secondary: const Color(0xFF1676FF),
    );

    final TextTheme _textTheme = TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );

    final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF1676FF),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    final ElevatedButtonThemeData _elevatedButtonThemeData =
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1676FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    final AppBarTheme _appBarTheme = AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );

    final ThemeData _lightTheme = ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      colorScheme: _lightColorScheme,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
    );

    light = _lightTheme;
  }

  ThemeData? light;

  static final DefaultTheme _instance = DefaultTheme._();

  static DefaultTheme get instance => _instance;
}
