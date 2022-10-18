import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  final ThemeData _theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
          headlineLarge: const TextStyle(fontWeight: FontWeight.w700),
          headlineSmall: const TextStyle(fontWeight: FontWeight.w700),
          titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: const TextStyle(fontWeight: FontWeight.w500),
        )
        .apply(
          bodyColor: const Color(0xff27243B),
          displayColor: const Color(0xff27243B),
        ),
  );

  ThemeData getThemeData() {
    return _theme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarTextStyle: _theme.textTheme.headlineLarge,
        backgroundColor: _theme.scaffoldBackgroundColor,
        surfaceTintColor: _theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(),
        filled: true,
        fillColor: const Color(0xffDDDDDD),
        hintStyle: const TextStyle(color: Color(0xff27243B)),
        constraints: const BoxConstraints(minHeight: 50),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFB6B6B6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _theme.colorScheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          backgroundColor: _theme.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
    );
  }
}

class DarkTheme {
  final ThemeData _theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: const Color(0xffffffff),
      displayColor: const Color(0xffffffff),
    ),
  );

  ThemeData getThemeData() {
    return _theme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        toolbarTextStyle: _theme.textTheme.headlineLarge,
        backgroundColor: _theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(),
        filled: true,
        fillColor: const Color(0xffDDDDDD),
        hintStyle: const TextStyle(color: Color(0xff27243B)),
        constraints: const BoxConstraints(minHeight: 50),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFB6B6B6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _theme.colorScheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          backgroundColor: _theme.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
