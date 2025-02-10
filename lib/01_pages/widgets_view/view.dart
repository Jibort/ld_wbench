// Classe general de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

// ignore_for_file: avoid_renaming_method_parameters

library;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/widgets_view/view.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';
import 'package:provider/provider.dart';

export "controller.dart";
export "state.dart";

class WidgetsViewBindings extends Bindings {
  @override
  void dependencies() {
    Debug.debug(1, "WidgetsViewBindings.dependencies(): IN...");
    WidgetsViewState state = WidgetsViewState(pTitle: "ViewTitle", pMsg: "");
    Debug.debug(1, "WidgetsViewBindings.dependencies(): Tag registrant: '${WidgetsViewCtrl.className}'");
    state.viewCtrl = WidgetsViewCtrl(pState: state);
    Debug.debug(1, "WidgetsViewBindings.dependencies(): ...OUT");
  }
}

class WidgetsView extends GetView<LdViewController> {
  WidgetsView({super.key}) {
    // Debug.debug(1, ("WidgetsView() [constructor])");
  }

  @override
  Widget build(BuildContext pCxt) {
    // Debug.debug(1, ("WidgetsView.build(BuildContext)");

    final LdViewController? vctrl = XReg.inst.isRegisteredTag(WidgetsViewCtrl.className)
        ? Get.find<LdViewController>(tag: WidgetsViewCtrl.className)
        : null;

    if (vctrl == null) {
      XReg.inst.logRegisteredCtrls();
      Debug.error("❌ `ViewController` encara no està registrat!", null);
      return Center(child: Text("Error carregant la vista."));
    }

    vctrl.themeProvider = Provider.of<ThemeProvider>(pCxt);
    return vctrl.buildView(pCxt);
  }
}
