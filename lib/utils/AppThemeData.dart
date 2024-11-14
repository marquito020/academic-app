import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0D47A1), // Azul oscuro académico
        secondary: Color(0xFF1976D2), // Azul secundario más claro
        background: Color(0xFFF5F5F5), // Fondo gris claro
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF0D47A1),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        elevation: 1,
        toolbarTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0D47A1),
        ),
        titleMedium: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16.0,
          color: Colors.black87,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[700],
          height: 1.4,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1976D2),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF0D47A1)),
      dividerColor: Colors.grey[300],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF1E3A8A), // Azul oscuro para el tema oscuro
        secondary: Color(0xFF64B5F6), // Azul secundario suave
        background: Color(0xFF121212),
        surface: Color(0xFF1F1F1F),
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.white70,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1E3A8A),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        elevation: 1,
        toolbarTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleMedium: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16.0,
          color: Colors.white70,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[500],
          height: 1.4,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF64B5F6),
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1F1F1F),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF64B5F6)),
      dividerColor: Colors.grey[700],
    );
  }
}
