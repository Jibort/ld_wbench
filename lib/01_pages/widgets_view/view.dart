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
export "data.dart";

class WidgetsViewBindings extends Bindings {
  @override
  void dependencies() {
    // Debug.info(("WidgetsViewBindings.dependencies() [in]");
    WidgetsViewData data = WidgetsViewData(pTitle: "CiewTitle", pMsg: "");
     Get.put(WidgetsViewCtrl(pState: data), tag: WidgetsViewCtrl.className, permanent: false);
    // Get.put(WidgetsViewCtrl(pState: data), tag: WidgetsViewCtrl.className);
    // Debug.info(("WidgetsViewBindings.dependencies() [out]");
  }
}

class WidgetsView extends GetView<WidgetsViewCtrl> {
  WidgetsView({super.key}) {
    // Debug.info(("WidgetsView() [constructor])");
  }

  @override
  Widget build(BuildContext pCxt) {
    // Debug.info(("WidgetsView.build(BuildContext)");

final WidgetsViewCtrl? controller = Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)
        ? Get.find<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)
        : null;

    if (controller == null) {
      Debug.error("❌ `WidgetsViewCtrl` encara no està registrat!", null);
      return Center(child: Text("Error carregant la vista."));
    }

    controller.themeProvider = Provider.of<ThemeProvider>(pCxt);
    return controller.buildWidget(pCxt);
  }
}
