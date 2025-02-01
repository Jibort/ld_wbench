// Widget base dels components de littleDroids.
// CreatedAt: 24-10-30 dc. JIQ

// ignore_for_file: prefer_final_fields, must_be_immutable, avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

abstract class LdWidget extends StatelessWidget {
  // MEMBRES DE TOTS ELS WIDGETS ------
  final int id;                // Identificador numéric únic que tenen tots els widgets.
  final String label;          // Etiqueta localitzada del widget.
  final String? errorMessage;  // En cas d'ocòrrer un error aquest és el missatge que li correspon.
  bool isEnabled = true;       // Determina si el widget pot set ocupat pel focus.
  bool isMandatory = false;    // Determina si el widget és de compliment obligatori.
  bool isVisible = true;       // Determina si el widget és visible.
  final FocusNode focusNode;   // Gestor del focus pel widget.
  OnWiddgetTapCallback? opTap; // Funció per a actuar davant el 'tap' sobre el widget, tot i que suporta altres widgets. 
  ViewController bCxt;         // Control·lador del widget. 
  // final BaseController bCtrl;

//  CONSTRUCTORS ----------------------
  LdWidget({
    super.key,
    required this.id,
    String? pLabel,
    required this.bCxt,
    this.errorMessage,
    this.isEnabled = true,
    this.isMandatory = false,
    this.isVisible = true,
    FocusNode? pFocusNode,
    this.opTap,
  }): label = pLabel ?? "?", focusNode = pFocusNode ?? FocusNode();

  // Gestió d'estils segons l'estat
  Color getBorderColor(BuildContext context) {
    if (!isEnabled) return Colors.grey;
    if (errorMessage != null) return Colors.red;
    return (focusNode.hasFocus)
        ? Theme.of(context).primaryColor
        : Theme.of(context).dividerColor;
  }

  TextStyle txsLabelStyle(BuildContext context) {
    return TextStyle(
      fontWeight: focusNode.hasFocus? FontWeight.bold : FontWeight.normal,
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

  // Neteja de recursos del widget
  void dispose();
  

  // CONSTRUCCIÓ DEL WIDGET -----------
  @override
  Widget build(BuildContext context) {
    bool showLabel = isVisible && runtimeType != LdButton && runtimeType != LdImage && runtimeType != LdTextField;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) Text(label, style: txsLabelStyle(context)),
        if (showLabel) const SizedBox(height: 4),
        if (isVisible) buildContent(context),
      ],
    );
  }

  // Retorna l'identificador únic del widget.
  int? getId() => id;

  // Retorna cert només en cas que el widget tingui el focus.
  bool get isFocused =>  focusNode.hasFocus;

  // Estableix la funció per a informar sobre el 'tap' al widget.
  set onTap(OnWiddgetTapCallback? pOnTap) => onTap = pOnTap;
}
