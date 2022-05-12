import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
            headlineLarge:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            headlineSmall:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            titleMedium:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
        .apply(
          bodyColor: const Color(0xff27243B),
          displayColor: const Color(0xff27243B),
        ),
  );

  ThemeData getThemeData() {
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        toolbarTextStyle: theme.textTheme.headlineLarge,
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: theme.scaffoldBackgroundColor,
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
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          primary: theme.primaryColor,
          onPrimary: Colors.white,
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

class DarkTheme {
  ThemeData theme = ThemeData(
    colorSchemeSeed: const Color(0xff4D3FC6),
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
            headlineLarge:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            headlineSmall:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            titleMedium:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
        .apply(
          bodyColor: const Color(0xffffffff),
          displayColor: const Color(0xffffffff),
        ),
  );

  ThemeData getThemeData() {
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        toolbarTextStyle: theme.textTheme.headlineLarge,
        backgroundColor: theme.scaffoldBackgroundColor,
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
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          primary: theme.primaryColor,
          onPrimary: Colors.white,
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
