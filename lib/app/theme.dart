import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light Theme (Açık Tema)
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Color(0xFFF0F8FF), //0xFF42B4CA, 0xFFD5E9ED
      secondary: Color(0xFF42B4CA),
      error: Color(0xFF414A4C),
      surface: Colors.white,
      onSurface: Color(0xFF414A4C),
      tertiary: Color(0xFFB5C4C7),

    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: const Color(0xFF42B4CA),
      ),
    ),
  );

  // Dark Theme (Koyu Tema)
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: Color(0xFF121212), // Koyu zemin
    colorScheme: ColorScheme.dark(
      primary: Colors.black, // Koyu temadaki ana renk
      secondary: Colors.white, // İkincil renk
      error: Color(0xFFB00020), // Hata rengi
      surface: Colors.black, // Yüzey rengi  //0xFF2C2C2C
      onSurface: Colors.white10, // Yüzeydeki yazı rengi
      tertiary: Color(0xFFB5C4C7), // Üçüncül renk
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white, // Koyu tema için beyaz ikonlar
      ),
    ),
  );
}
