// Tema visual per a l'aplicació Sabina.
// 2025/01/19 dg. JIQ


// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TAMANYS DE LES ICONES --------------
final double defIconWidth = 24.0.h;
final double defIconHeight = 24.0.h;

// COLORS CONSTANTS -------------------
const Color lightPrimary = Color(0xFF0077B6);    // Blau primary intens 
const Color lightSecondary = Color(0xFF48CAE4); // Blau secundary
const Color lightSurface = Colors.white;
const Color lightOnPrimary = Colors.white;
const Color lightOnSecondary = Colors.black;

// TAMANYS DE FONT --------------------
final double buttonFontSize = 12.0.h;

// TAMANYS D'ICONA --------------------
final double buttonIconSize = 16.0.h;

// CLASSE DE TEMA 'LdTheme' -----------
class LdTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: lightPrimary, // Blau intens
      secondary: lightSecondary,
      surface: lightSurface,
      background: Color(0xFFE3F2FD), // Blau suau de fons
      onPrimary: lightSurface,
      onSecondary: lightOnSecondary,
    ),
    
    iconTheme: IconThemeData(
      color: lightOnPrimary, size: 24.0.h // lightPrimary, size: 24,
    ),
    
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: lightPrimary),
    ),
    
    buttonTheme: ButtonThemeData(
      buttonColor: lightPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF48CAE4), // Blau clar en fosc
      secondary: lightPrimary, // Blau intens
      surface: Color(0xFF121212),
      background: Color(0xFF1E1E1E),
      onPrimary: lightOnSecondary,
      onSecondary: lightSurface,
    ),

    iconTheme: IconThemeData(
      color: lightOnSecondary, size: 24.0.h
    ),
    
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF48CAE4)),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF48CAE4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

// CLASSE DE GESTIÓ DE TEMES ----------
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get mode => _themeMode;

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notifica el canvi de tema
  }

  void setLight() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDark() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }
}