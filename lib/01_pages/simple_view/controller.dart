// Classe control·ladora de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

import 'state.dart';

class WidgetsViewCtrl extends LdViewController {
  static String get className => "WidgetsViewCtrl";

  // WIDGETS DEL VIEW -----------------
  LdTextField? edtName;
  LdTextField? edtFamilyName;
  LdTextField? edtAddress;
  
  // IDENTIFICADORS DE CAMPS ----------
  static String btnA      = "2_000";
  static String btnB      = "2_001";
  static String imgpd     = "2_002";
  static String edtText   = "2_003";
  static String edtText2  = "2_004";
  static String edtText3  = "2_005";
  static String actSwitch = "2_006";

  // COMPONENTS -----------------------
  late LdButton ldBtnA;

  // CONSTRUCTORS ---------------------
  WidgetsViewCtrl({required WidgetsViewState pState}):
    super(pState: pState) {
    Debug.debug(1, "WidgetsViewCtrl() [constructor]...");

    addWidgets([btnA, btnB, imgpd, actSwitch ]);
    Debug.debug(1, "WidgetsViewCtrl() ...[constructor]");
  }

  // EXTENSIÓ DE 'ViewController' -----
  LdTextField _buildEdtName(BuildContext context) {
    edtName ??= LdTextField(
      pId: edtText, 
      imgId: "psicodex_2",
      pLabel: "Nom",
      pVCtrl: this,
);
    return edtName!;
  }

  LdTextField _buildEdtFamilyName(BuildContext context) {
    edtFamilyName ??= LdTextField( 
      pId: edtText2, 
      imgId: "icon_edit_icon",
      pLabel: "Cognoms",
      pVCtrl: this,
    );

    return edtFamilyName!;
  }

  LdTextField _buildEdtAddress(BuildContext context) {
    edtAddress ??= LdTextField( 
      pId:  edtText3, 
      imgId: "align_vertical_bottom_outlined",
      pLabel: "Direcció",
      pVCtrl: this,
    );
    
    return edtAddress!;
  }
  
  Widget _buildSafeButtonA(BuildContext context) {
    try {
      ldBtnA = LdButton(
          pVCtrl: this,
          pId: btnA,
          imgId: "add_location",
          imgKey: "add_location",
          pOnPressed: () { },
          pLabel: 'Butó',
          pIsPrimary: true,
        );
    } on Exception catch (e) {
      Debug.error("ERROR construint LdButton A: $e", e);
      return Text("Error carregant el botó A.");
    } catch (e) {
      Debug.error("ERROR construint LdButton A: $e", null);
      return Text("Error carregant el botó A.");
    }
    return ldBtnA;
  }

Widget _buildSafeButtonB(BuildContext context) {
    try {
      return LdButton(
          pVCtrl: this,
          pId: btnB,
          pOnPressed: () { 
            ldBtnA.setEnabled = !ldBtnA.isEnabled;
            themeProvider!.toggleTheme(); 
            notify(pTgts: [btnA, edtText]);
          },
          pLabel: 'Butó Secundari',
          imgId: "align_vertical_bottom_outlined",
          pIsPrimary: false,
        );
    } catch (e) {
      // Debug.debug(1, ("ERROR construint LdButton B: $e");
      // Debug.debug(1, (stack.toString());
      return Text("Error carregant el botó B.");
    }
  }

  @override
  Widget buildView(BuildContext pCxt) {
    return BaseScaffold(
      pCxt: pCxt,
      pTitle: state.title,
      pViewCtrl: this,
      // pActions: [ LdActionIcon(id: actSwitch, bCxt: this, iconData: Icons.mode, onPressed: () {
      //     notify(pTargets: [ btnA, edtText, actSwitch ]);
      //     themeProvider!.toggleTheme(); 
      //   })
      // ],
      pBody: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildSafeButtonA(pCxt),
        SizedBox(height: 15.0.h),
        _buildSafeButtonB(pCxt),
        SizedBox(height: 15.0.h),
        LdImage(
          pId: imgpd, 
          pVCtrl: this,
          imgId: "psicodex", 
          pWidth: 20.0.w, 
          pHeight: 20.0.h
        ), //"icon_edit_icon"
        SizedBox(height: 15.0.h),
        _buildEdtName(pCxt),
        _buildEdtFamilyName(pCxt),
        _buildEdtAddress(pCxt),
      ])),
    );
  }
}
