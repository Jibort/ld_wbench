// Tema visual per a l'aplicació Sabina.
// 2025/01/19 dg. JIQ


// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// MATERIAL DEFUALT COLOR -------------
final defBgColor = MaterialStateProperty.all<Color>(Colors.white);
final defFgColor = MaterialStateProperty.all<Color>(Colors.black);
final defAlphaColor = MaterialStateProperty.all<Color>(Colors.transparent);

// TAMANYS DE LES ICONES --------------
final double defIconWidth = 24.0.h;
final double defIconHeight = 24.0.h;

// CONSTANTS ACTUALITZADES DE COLORS ==
// Light Globals ----------------------
const Color lightEnabledPrimaryColor = Color(0xFF0077B6); // Blau primary intens
const Color lightEnabledSecondaryColor =  Color(0xFF48CAE4); // Blau secundary
const Color lightDisabledPrimaryColor = Colors.grey;
final Color lightDisabledSecondaryColor = Colors.grey.shade50;
const Color lightErrorPrimaryColor = Colors.red;
final Color lightErrorSecondaryColor = Colors.red.shade300;

// Dark Globals -----------------------
const Color darkEnabledPrimaryColor =  Color(0xFF48CAE4); // Blau secundary
const Color darkEnabledSecondaryColor = Color(0xFF0077B6); // Blau primary intens
final Color darkDisabledPrimaryColor = Colors.grey.shade50;
const Color darkDisabledSecondaryColor = Colors.grey;
final Color darkErrorPrimaryColor = Colors.red.shade300;
const Color darkErrorSecondaryColor = Colors.red;

// Button Colors ----------------------
const Color lightEnabledPrimarySurfaceButtonColor = lightEnabledPrimaryColor;
const Color lightEnabledSecondarySurfaceButtonColor = lightEnabledSecondaryColor;
const Color lightDisabledPrimarySurfaceButtonColor = lightDisabledPrimaryColor;
final Color lightDisabledSecondarySurfaceButtonColor = lightDisabledSecondaryColor;
const Color lightErrorPrimarySurfaceButtonColor = lightErrorPrimaryColor;
final Color lightErrorSecondarySurfaceButtonColor = lightErrorSecondaryColor;

const Color lightEnabledPrimaryBorderButtonColor = lightEnabledSecondaryColor;
const Color lightEnabledSecondaryBorderButtonColor = lightEnabledPrimaryColor;
final Color lightDisabledPrimaryBorderButtonColor =  lightDisabledSecondaryColor;
const Color lightDisabledSecondaryBorderButtonColor = lightDisabledPrimaryColor;
const Color lightErrorPrimaryBorderButtonColor = lightErrorPrimaryColor;
final Color lightErrorSecondaryBorderButtonColor = lightErrorSecondaryColor;

const Color darkEnabledPrimarySurfaceButtonColor = lightEnabledSecondaryColor;
const Color darkEnabledSecondarySurfaceButtonColor = lightEnabledPrimaryColor;
final Color darkDisabledPrimarySurfaceButtonColor =  lightDisabledSecondaryColor;
const Color darkDisabledSecondarySurfaceButtonColor =lightDisabledPrimaryColor;
final Color darkErrorPrimarySurfaceButtonColor = lightErrorSecondaryColor;
const Color darkErrorSecondarySurfaceButtonColor = lightErrorPrimaryColor;

const Color darkEnabledPrimaryBorderButtonColor =lightEnabledPrimaryColor;
const Color darkEnabledSecondaryBorderButtonColor =  lightEnabledSecondaryColor;
const Color darkDisabledPrimaryBorderButtonColor =   lightDisabledPrimaryColor;
final Color darkDisabledSecondaryBorderButtonColor =lightDisabledSecondaryColor;
final Color darkErrorPrimaryBorderButtonColor = lightErrorSecondaryColor;
const Color darkErrorSecondaryBorderButtonColor = lightErrorPrimaryColor;




// COLORS CONSTANTS -------------------
const Color lightPrimaryColor = Color(0xFF0077B6);    // Blau primary intens 
const Color lightSecondaryColor = Color(0xFF48CAE4); // Blau secundary
const Color lightSurfaceColor = Colors.white;
const Color lightOnPrimaryColor = Colors.white;
const Color lightOnSecondaryColor = Colors.black;
const Color lightFontEnabledColor = Colors.black;
const Color lightFontDisabledColor = Colors.grey;
const Color lightButtonPrimaryFontColor = Colors.white;
const Color lightButtonSecondaryFontColor = Colors.black54;


const Color darkPrimaryColor = Color(0xFF48CAE4);    // Blau primary
const Color darkSecondaryColor =  Color(0xFF0077B6); // Blau secundary
final Color darkSurfaceColor = Colors.grey.shade50;
const Color darkOnPrimaryColor = Colors.black;
const Color darkOnSecondaryColor = Colors.white;
const Color darkFontEnabledColor = Colors.black;
const Color darkFontDisabledColor = Colors.grey;

const Color fontEnabledColor = Colors.black;
const Color fontDisabledColor = Colors.grey;
const Color fontHintColor = Colors.black12;
const Color fontErrorColor = Colors.red;
const Color fontWarningColor = Colors.yellow;
const Color fontSuccessColor = Colors.green;
const Color fontAccentColor = Colors.blue;
const Color fontOnAccentColor = Colors.white;

// TAMANYS DE FONT --------------------
final double buttonFontSize = 12.0.h;

// TAMANYS D'ICONA --------------------
final double buttonIconSize = 16.0.h;

// CLASSE DE TEMA 'LdTheme' -----------
class LdTheme {
  // TEMA CLAR ------------------------
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: lightPrimaryColor, // Blau intens
      secondary: lightSecondaryColor,
      error: fontErrorColor,
      surface: lightSurfaceColor,
      background: Color(0xFFE3F2FD), // Blau suau de fons
      onPrimary: lightSurfaceColor,
      onSecondary: lightOnSecondaryColor,
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white, // Color de fons del TextField
      prefixIconColor: Colors.black, // lightPrimaryColor,
      contentPadding: EdgeInsets.only(left: 10.0.h, right: 5.0.h, top: 10.0.h, bottom: 10.0.h),
      isDense: true,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16.0.h),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightPrimaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0), // Vora quan té focus
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400), // Vora quan està desactivat
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontErrorColor, width: 2.0), // Vora en cas d'error
      ),
    ),
    
    iconTheme: IconThemeData(
      color: lightOnPrimaryColor, 
      size: 24.0.h,
    ),
    
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 10.0.h, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 12.0.h, color: Colors.black),
      titleLarge: TextStyle(fontSize: 16.0.h, fontWeight: FontWeight.bold, color: lightPrimaryColor),
    ),
    
    buttonTheme: ButtonThemeData(
      buttonColor: lightPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      disabledColor: Colors.grey,
      textTheme: ButtonTextTheme.primary,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(lightPrimaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(lightButtonPrimaryFontColor),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: buttonFontSize)),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      
    ),
  );

  // TEMA FOSC ------------------------
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF48CAE4), // Blau clar en fosc
      secondary: lightPrimaryColor, // Blau intens
      error: fontErrorColor,
      surface: Color(0xFF121212),
      background: Color(0xFF1E1E1E),
      onPrimary: lightOnSecondaryColor,
      onSecondary: lightSurfaceColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[50], // Color de fons del TextField
      labelStyle: TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightOnPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0), // Vora quan té focus
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400), // Vora quan està desactivat
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontErrorColor, width: 2.0), // Vora en cas d'error
      ),
    ),
    
    iconTheme: IconThemeData(
      color: lightOnSecondaryColor,
      size: 24.0.h,
    ),
    
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 10.0.h, color: fontEnabledColor),
      bodyMedium: TextStyle(fontSize: 12.0.h, color: fontEnabledColor),
      titleLarge: TextStyle(fontSize: 16.0.h, fontWeight: FontWeight.bold, color: lightSecondaryColor),
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
    _themeMode = (Get.isDarkMode) ? ThemeMode.light : ThemeMode.dark;
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

Color disabledFgColor(BuildContext pCxt) {
    ThemeData theme = Theme.of(pCxt);
    return theme.disabledColor;
  }

  // MaterialStateProperty<Color?> getSurfaceColor(BuildContext pCxt, {
  //   Type pType = LdWidget, 
  //   bool pIsPrimary = true,
  //   bool pIsEnabled = true,
  //   bool pIsFocused = false,
  //   bool pIsError = false,
  // }) {
  //   ThemeData theme = Theme.of(pCxt);

  //   switch (pType) {
  //   case LdActionIcon _:
  //     return defAlphaColor;

  //   case LdButton _:
  //     return theme.elevatedButtonTheme.style!.backgroundColor?? defBgColor;

  //   case LdImage _:
  //     return defAlphaColor;

  //   case LdTextField _:
  //     return MaterialStateProperty.all<Color>(theme.inputDecorationTheme.) ?? defBgColor;

  //   case LdWidget _:
  //   default:
  //     Debug.fatal("ThemeProvider.getSurfaceColor(): Tipus de widget desconegut!", null);
  //   }
  //   return Theme.of(pCxt).colorScheme.surface;
  // }
}