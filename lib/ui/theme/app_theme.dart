import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData getThemeData(context) {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
    );
  }
}

class DarkTheme {
  ThemeData getThemeData(context) {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
    );
  }
}
