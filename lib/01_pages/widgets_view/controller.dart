// Classe control·ladora de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

import 'data.dart';

class WidgetsViewCtrl extends ViewController {
  static String get className => "WidgetsViewCtrl";
  // CONSTRUCTORS ---------------------
  WidgetsViewCtrl({required WidgetsViewData pState}):
    super(pTitle: "Títol des de WidgetsViewCtrl", pMsg: "") {
    state = pState;

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Get.put(this, tag: WidgetsViewCtrl.className);
    }
  }

  // EXTENSIÓ DE 'ViewController' -----
  @override
  Widget buildWidget(BuildContext pCxt) {
    Debug.info("WidgetsViewCtrl.buildWidget(BuildContext)");
    
    WidgetsViewData data = super.state as WidgetsViewData;
    return BaseScaffold(
      pCxt: pCxt,
      pTitle: data.title,
      pViewCtrl: this,
      pBody: Center(
          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
        LdButton(
          id: 2_000,
          onPressed: () {
            Debug.info("Butó Primary: PRÉS");
          },
          pLabel: 'Butó',
          imageKey: "add_location",
          isPrimary: true,
        ),

        LdButton(
          id: 2_001,
          onPressed: () { 
            themeProvider!.toggleTheme(); 
          },
          pLabel: 'Butó Secundari',
          isPrimary: false,
        ),
      ])),
    );
  }
}
