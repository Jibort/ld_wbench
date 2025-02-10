// Widget base dels components de littleDroids.
// CreatedAt: 24-10-30 dc. JIQ

// ignore_for_file: prefer_final_fields, must_be_immutable, avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

abstract class LdWidget extends StatelessWidget {
  // MEMBRES --------------------------
  final LdWidgetController _wCtrl; // Control·lador del widget. 
  final LdViewController   _vCtrl; // Control·lador de la vista on es troba el widget.

//  CONSTRUCTORS ----------------------
  LdWidget({super.key,  required LdWidgetController pWCtrl})
  : _wCtrl = pWCtrl, _vCtrl = pWCtrl.vCtrl;

  // GETTERS/SETTERS -------------------
  String  get label        => _wCtrl.label;
  int?    get errorCode    => _wCtrl.errorCode;
  String? get errorMessage => _wCtrl.errorMessage;
  bool    get isError      => _wCtrl.errorCode != null;
  bool    get isEnabled    => _wCtrl.isEnabled;
  bool    get isMandatory  => _wCtrl.isMandatory;
  bool    get isVisible    => _wCtrl.isVisible;
  bool    get isPrimary    => _wCtrl.isPrimary;
  FocusNode get focusNode  => _wCtrl.focusNode;
  bool    get hasFocus     => _wCtrl.hasFocus;
  LdWidgetController get wCtrl => _wCtrl;
  LdViewController get vCtrl => _vCtrl;

  set label(String pLabel)                => _wCtrl.label = pLabel;
  set errorCode(int? pErrorCode)          => _wCtrl.errorCode = pErrorCode;
  set errorMessage(String? pErrorMessage) => _wCtrl.errorMessage = pErrorMessage;
  set setEnabled(bool pIsEnabled)         => _wCtrl.isEnabled = pIsEnabled;
  set setVisible(bool pIsVisible)         => _wCtrl.isVisible = pIsVisible;
  set setMandatory(bool pIsMandatory)     => _wCtrl.isMandatory = pIsMandatory;
  set setPrimary(bool pIsPrimary)         => _wCtrl.isPrimary  = pIsPrimary;
  
  // Gestió d'estils segons l'estat
  Color getBorderColor(BuildContext context) {
    if (!isEnabled) return Colors.grey;
    if (errorMessage != null) return Colors.red;
    return (hasFocus)
        ? Theme.of(context).colorScheme.surface
        : Theme.of(context).dividerColor;
  }

  TextStyle txsLabelStyle(BuildContext context) {
    return TextStyle(
      fontWeight: hasFocus? FontWeight.bold : FontWeight.normal,
      fontSize: 16.0.h,
    );
  }

  TextStyle txsEditStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16.0.h,
    );
  }

  // FUNCIONS ABSTRACTES --------------
  // Contingut específic del widget fill
  Widget buildContent(BuildContext context);

  // CONSTRUCCIÓ DEL WIDGET -----------
  @override
  Widget build(BuildContext context) {
    bool showLabel = isVisible && runtimeType != LdButton && runtimeType != LdImage && runtimeType != LdTextField;
    return Container(
      padding: EdgeInsets.only(left: 15.0.h, right: 15.0.h, top: 20.0.h),
      child : Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel) Text(label, style: txsLabelStyle(context)),
          if (showLabel) const SizedBox(height: 4),
          if (isVisible) buildContent(context),
        ],
      )
    );
  }

  // FUNCIONALITAT XCTRL --------------
  XCtrl get xCtrl => _wCtrl.xCtrl;
  String get id => _wCtrl.id;
  String get typeName => _wCtrl.type.toString();  
  String get tag => _wCtrl.tag;
}
