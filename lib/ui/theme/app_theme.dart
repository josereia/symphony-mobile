import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff4D3FC6),
    ).copyWith(
      outline: const Color(0xffD0D0D0),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
            headlineLarge:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
        .apply(
          bodyColor: const Color(0xff27243B),
          displayColor: const Color(0xff27243B),
        ),
    brightness: Brightness.light,
    useMaterial3: true,
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
        hintStyle: const TextStyle(color: Colors.black),
        constraints: const BoxConstraints(minHeight: 50),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
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
          elevation: 0,
          alignment: Alignment.center,
          fixedSize: const Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class DarkTheme extends StatefulElement {
  DarkTheme(StatefulWidget widget) : super(widget);
}
