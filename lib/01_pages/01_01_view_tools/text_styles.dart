// Conjunt d'estils de text de l'aplicació.
// createdAt: 24/10/17 dj. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:ld_wbench/06_theme/app_theme.dart';

TextStyle txsAppBarMainTitleStyle({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? Theme.of(pCxt).appBarTheme.backgroundColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarTitleStyle({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? Theme.of(pCxt).appBarTheme.foregroundColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarSubtitleStyle({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.h,
    fontStyle: FontStyle.normal,
    color: pFgColor ?? Theme.of(pCxt).appBarTheme.foregroundColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarProgressionTitleStyle({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: pFgColor ?? Theme.of(pCxt).appBarTheme.foregroundColor ?? Colors.black,
    fontFamily: 'Roboto',
  );
}

TextStyle txsAppBarProgressionSubtitleStyle({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: pFgColor ?? Theme.of(pCxt).appBarTheme.foregroundColor ?? Colors.black,
    fontFamily: 'Roboto',
  );
}

TextStyle txsLabelStyle({
  required BuildContext pCxt,
  bool pIsEnabled = true, 
  bool pIsFocused =  false, 
  bool pIsError = false}) {
    ThemeData theme = Theme.of(pCxt);
    return TextStyle(
      fontWeight: (pIsFocused)? FontWeight.bold: FontWeight.normal,
      fontSize: 17.h,
      fontStyle: (pIsEnabled)
        ? (pIsFocused)
          ? FontStyle.normal
          : FontStyle.italic
        : FontStyle.normal,
      backgroundColor: Colors.transparent,
      color: (!pIsEnabled)
        ? theme.disabledColor
        : (pIsFocused)
          ? theme.colorScheme.primary
          : (pIsError)
            ? theme.colorScheme.error
            : theme.colorScheme.onSecondary,
      fontFamily: 'Roboto',
    );
}

TextStyle txsTextField({
  required BuildContext pCxt, 
  bool pEnabled = true, 
  bool pFocused =  false, 
  bool pError = false}) {
  return TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: (pError)
      ? Theme.of(pCxt).colorScheme.error
      : (pEnabled)
        ? Theme.of(pCxt).primaryColor
        : Theme.of(pCxt).disabledColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsLabelField({
  required BuildContext pCxt, 
  bool pFocused = false,
  bool pEnabled = true,
  bool pError = false}) {
  return TextStyle(
    fontWeight: (pFocused)? FontWeight.bold: FontWeight.normal,
    fontSize: 16.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.transparent,
    color: (pError)
      ? Theme.of(pCxt).colorScheme.error
      : (pEnabled)
        ? Theme.of(pCxt).primaryColor
        : Theme.of(pCxt).disabledColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsButtonField({
  required BuildContext pCxt, 
  bool pFocused = false, 
  bool pEnabled = true}) {
  return TextStyle(
    fontWeight: (pFocused)? FontWeight.bold: FontWeight.normal,
    fontSize: 16.h,
    fontStyle: FontStyle.normal,
    backgroundColor: (pEnabled)
        ? Theme.of(pCxt).dialogBackgroundColor
        : Theme.of(pCxt).disabledColor,
    color: (pEnabled)
        ? Theme.of(pCxt).primaryColor
        : Theme.of(pCxt).disabledColor,
    fontFamily: 'Roboto',
  );
}

TextStyle txsFloatingLabel({required BuildContext pCxt, Color? pFgColor}) {
  return TextStyle(
    leadingDistribution: TextLeadingDistribution.even,
    height: 2.0.h,
    fontWeight: FontWeight.normal,
    fontSize: 18.h,
    fontStyle: FontStyle.normal,
    backgroundColor: Colors.white,
    color: pFgColor ?? Colors.black,
    fontFamily: 'Roboto',
  );
}
