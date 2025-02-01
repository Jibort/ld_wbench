// Extensió de 'Scaffold' pel projecte Sabina.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/view_controller.dart';
import 'package:ld_wbench/05_widgets/index.dart';

class BaseScaffold extends Scaffold {
  Color foregroundColor;
  BaseScaffold({
    super.key,
    required BuildContext pCxt,
    required ViewController pViewCtrl,
    required Widget? pBody,
    required String pTitle,
    String? pSubTitle,
    LdActionIcon? pLeading,
    super.floatingActionButton,
    super.drawer,
    super.bottomNavigationBar,
    super.bottomSheet,
    Color? pBackgroundColor,
    Color? pForegroundColor,
    bool super.resizeToAvoidBottomInset = true,
  })  : foregroundColor = pForegroundColor ?? Theme.of(pCxt).primaryColor,
        super(
            backgroundColor: pBackgroundColor ?? Theme.of(pCxt).scaffoldBackgroundColor,
            appBar: BaseAppBar(
              pCxt: pCxt,
              pBgColor: pBackgroundColor ?? Theme.of(pCxt).scaffoldBackgroundColor,
              pFgColor: pForegroundColor ?? Theme.of(pCxt).primaryColor,
              pTitle: pTitle,
              pSubTitle: pSubTitle,
              pLeading: pLeading,
              pViewCtrl: pViewCtrl,
              pActions: [
                LdActionIcon(id: 2_002, bCxt: pViewCtrl, onPressed: () { 
                  
                }, 
              )],
            ),
            body: pBody);
}
