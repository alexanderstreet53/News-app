import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // TLDR brand palette — bold, editorial, not generic
  static const Color brand = Color(0xFF0A0E27);
  static const Color brandAccent = Color(0xFF6C5CE7);
  static const Color brandHot = Color(0xFFFF6B6B);
  static const Color brandCyan = Color(0xFF00D2D3);
  static const Color brandGold = Color(0xFFFFD93D);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: brandAccent,
        brightness: Brightness.light,
        primary: brandAccent,
        secondary: brandHot,
        surface: const Color(0xFFF7F7FB),
        onSurface: brand,
      ),
      scaffoldBackgroundColor: const Color(0xFFF7F7FB),
      textTheme: _textTheme(Brightness.light),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF7F7FB),
        foregroundColor: brand,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: brand,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade200,
        thickness: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: brandAccent,
        brightness: Brightness.dark,
        primary: brandAccent,
        secondary: brandHot,
        surface: const Color(0xFF0F1123),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF0A0D1F),
      textTheme: _textTheme(Brightness.dark),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: const Color(0xFF161933),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFF0A0D1F),
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(0.06),
        thickness: 1,
      ),
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final c = brightness == Brightness.light ? brand : Colors.white;
    final muted = brightness == Brightness.light
        ? const Color(0xFF6B7280)
        : const Color(0xFF9CA3AF);

    return TextTheme(
      // Hero headlines — Space Grotesk for that distinctive tech-editorial feel
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: c,
        letterSpacing: -1.5,
        height: 1.1,
      ),
      headlineLarge: GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: c,
        letterSpacing: -1,
        height: 1.15,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: c,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      // Titles — tighter, bolder
      titleLarge: GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: c,
        letterSpacing: -0.3,
        height: 1.25,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: c,
        height: 1.35,
      ),
      // Body — Inter for readability
      bodyLarge: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: c,
        height: 1.65,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: muted,
        height: 1.55,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: muted,
      ),
      // Labels — mono-inspired for tags
      labelLarge: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: c,
        letterSpacing: 0.5,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: muted,
        letterSpacing: 0.5,
      ),
    );
  }
}
