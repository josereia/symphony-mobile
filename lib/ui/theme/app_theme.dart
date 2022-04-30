import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData getThemeData(context) {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme.copyWith(
              bodyText1: const TextStyle(fontWeight: FontWeight.normal),
            ),
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
          borderSide: const BorderSide(color: Color(0xffD0D0D0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff4D3FC6)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 198, 63, 63)),
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

class DarkTheme {
  ThemeData getThemeData(context) {
    return ThemeData(
      colorSchemeSeed: const Color(0xff4D3FC6),
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context)
            .textTheme
            .copyWith(
              bodyText1: const TextStyle(fontWeight: FontWeight.normal),
            )
            .apply(bodyColor: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(),
        filled: true,
        fillColor: const Color(0xffDDDDDD),
        hintStyle: const TextStyle(color: Colors.black),
        constraints: const BoxConstraints(maxHeight: 50),
        prefixIconColor: Colors.black,
        suffixIconColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffD0D0D0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff4D3FC6)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 198, 63, 63)),
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
