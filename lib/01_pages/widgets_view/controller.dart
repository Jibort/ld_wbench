// Classe control·ladora de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

import 'data.dart';

class WidgetsViewCtrl extends ViewController {
  static String get className => "WidgetsViewCtrl";
  
  // IDENTIFICADORS DE CAMPS ----------
  static int btnA = 2_000;
  static int btnB = btnA + 1;
  static int imgpd = btnB + 1;
  static int edtText = imgpd + 1;

  // CONSTRUCTORS ---------------------
  WidgetsViewCtrl({required WidgetsViewData pState}):
    super(pTitle: "Títol des de WidgetsViewCtrl", pMsg: "") {
    state = pState;

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Get.put(this, tag: WidgetsViewCtrl.className);
    }
    addWidgets([btnA, btnB, imgpd]);
  }

  // EXTENSIÓ DE 'ViewController' -----
Widget _buildSafeButtonA(BuildContext context) {
    try {
      return LdButton(
          id: btnA,
          bCxt: this,
          onPressed: () {
            // Debug.info(("Butó Primary: PRÉS");
          },
          pLabel: 'Butó',
          // imageKey: "add_location",
          ikey: "add_location",
          iconData: Icons.add_location,
          isPrimary: true,
        );
    } catch (e) {
      // Debug.info(("ERROR construint LdButton A: $e");
      // Debug.info((stack.toString());
      return Text("Error carregant el botó A.");
    }
  }

Widget _buildSafeButtonB(BuildContext context) {
    try {
      return LdButton(
          id: btnB,
          bCxt: this,
          onPressed: () { 
            notify(pTargets: [btnA, edtText]);
            themeProvider!.toggleTheme(); 
          },
          pLabel: 'Butó Secundari',
          ikey: "align_vertical_bottom_outlined",
          iconData: Icons.align_vertical_bottom_outlined,
          isPrimary: false,
        );
    } catch (e) {
      // Debug.info(("ERROR construint LdButton B: $e");
      // Debug.info((stack.toString());
      return Text("Error carregant el botó B.");
    }
  }

  @override
  Widget buildWidget(BuildContext pCxt) {
    // Debug.info(("WidgetsViewCtrl.buildWidget(BuildContext)");
    
    WidgetsViewData data = super.state as WidgetsViewData;
    return BaseScaffold(
      pCxt: pCxt,
      pTitle: data.title,
      pViewCtrl: this,
      pBody: Center(
          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildSafeButtonA(pCxt),
        SizedBox(height: 15.0.h),
        _buildSafeButtonB(pCxt),
        SizedBox(height: 15.0.h),
        LdImage(id: imgpd, bCxt: this, imageKey: "psicodex", width: 20.0.w, height: 20.0.h), //"icon_edit_icon"
        SizedBox(height: 15.0.h),
        LdTextField(id: edtText, bCxt: this, imageKey: "psicodex_2", pLabel: "Nom de pila"), // "icon_edit_icon"
      ])),
    );
  }
}
