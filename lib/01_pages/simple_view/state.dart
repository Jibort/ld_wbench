// Classe magatzem de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/01_pages/widgets_view/view.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

class WidgetsViewState extends LdViewState {
  // FUNCIONS ESTÀTIQUES --------------
  // static WidgetsViewState createInstance({required String pTitle, required String pMsg, String? pErrorCode, String? pErrorMessage, Exception? pException}) {
  //   // Debug.debug(1, ("WidgetsViewData.createInstance(ViewController, ...)");
  
  //   return WidgetsViewState(
  //     pTitle: pTitle,
  //     pMsg: pMsg,
  //     pErrorCode: pErrorCode,
  //     pErrorMessage: pErrorMessage,
  //     pException: pException,
  //   );
  // }

  // MEMBRES --------------------------
  
  // CONSTRUCTORS ---------------------
  WidgetsViewState({
   required super.pTitle,
   required super.pMsg,
   super.pErrorCode, super.pErrorMessage,
   super.pException}) {
    // Debug.debug(1, ("WidgetsViewData(title, msg, errorCode, errorMessage)");
   }
  
  WidgetsViewState.fromStorage()
  : super(pTitle: "Test de Widgets Sabina", pMsg: "Prova dels widgets");

  WidgetsViewState.fromArgs(): 
  super(
    pTitle: Get.arguments['title'] ?? "Error: Sense 'title'",
    pMsg: Get.arguments['msg'] ?? "Ha aparegut un error!\n${Get.arguments['exc']?? ""}"
  );
  
  @override
  Future<void> loadData() async {
    // Debug.debug(1, ("WidgetsViewData.loadData() async [1]");

    if (!isNew) {
      // Debug.debug(1, ("⚠️ Ja carregat, sortint.");
      return;
    }

    if (!XReg.inst.isRegisteredTag(WidgetsViewCtrl.className)) {
      Debug.error("⚠️ WidgetsViewCtrl encara no està registrat! Es retarda loadData().", null);
      return;
    }

    Exception? exc;
    setPreparing();

    List<ImageAndSize> imgs = [
      ImageAndSize(tgts: [WidgetsViewCtrl.btnA], key: "add_location", source: Icons.add_location, width: 24.0.h, height: 24.0.h),
      ImageAndSize(tgts: [WidgetsViewCtrl.edtText], key: "icon_edit_icon", source: Icons.account_tree_outlined, width: 24.0.h, height: 24.0.h),
      ImageAndSize(tgts: [WidgetsViewCtrl.btnB], key: "align_vertical_bottom_outlined", source: Icons.align_vertical_bottom_outlined, width: 24.0.h, height: 24.0.h),
      ImageAndSize(tgts: [WidgetsViewCtrl.imgpd], key: "psicodex", source: "assets/images/psico_dex.png", width: 60.0.h, height: 60.0.h),
      ImageAndSize(tgts: [WidgetsViewCtrl.imgpd], key: "psicodex_2", source: "assets/images/psico_dex.png", width: defIconWidth, height: defIconHeight),
    ];
    
    stLoadImages(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        await LdImageController.inst.loadImages(this, imgs);
      } on Exception catch (pExc) {
        Debug.error("⚠️ Error en loadImages():", pExc);
        exc = pExc;
      }
      return exc;
    }

    sneakFn(stLoadImages);
    setLoading();

    await runSteps().timeout(Duration(seconds: 5), onTimeout: () {
      Debug.error("Timeout a runSteps()! S'està bloquejant la càrrega?", null);
      return ([], Exception("Timeout a la càrrega de dades"));
    }).then((pLExc) {
      setLoaded(pLExc.$2);
    });
  }
}
