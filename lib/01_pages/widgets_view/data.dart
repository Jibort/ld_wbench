// Classe magatzem de la vista de widgets.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/01_pages/widgets_view/view.dart';
import 'package:ld_wbench/02_tools/index.dart';

class WidgetsViewData extends ViewData {
  // FUNCIONS ESTÀTIQUES --------------
  static WidgetsViewData createInstance({required String pTitle, required String pMsg, String? pErrorCode, String? pErrorMessage, Exception? pException}) {
    // Debug.info(("WidgetsViewData.createInstance(ViewController, ...)");
  
    return WidgetsViewData(
      pTitle: pTitle,
      pMsg: pMsg,
      pErrorCode: pErrorCode,
      pErrorMessage: pErrorMessage,
      pException: pException,
    );
  }

  // MEMBRES --------------------------
  
  // CONSTRUCTORS ---------------------
  WidgetsViewData({
   required super.pTitle,
   required super.pMsg,
   super.pErrorCode, super.pErrorMessage,
   super.pException}) {
    // Debug.info(("WidgetsViewData(title, msg, errorCode, errorMessage)");
   }
  
  WidgetsViewData.fromStorage()
  : super(pTitle: "Test de Widgets Sabina", pMsg: "Prova dels widgets");

  WidgetsViewData.fromArgs(): 
  super(
    pTitle: Get.arguments['title'] ?? "Error: Sense 'title'",
    pMsg: Get.arguments['msg'] ?? "Ha aparegut un error!\n${Get.arguments['exc']?? ""}"
  );
  
  @override
  Future<void> loadData() async {
    // Debug.info(("WidgetsViewData.loadData() async [1]");

    if (!isNew) {
      // Debug.info(("⚠️ Ja carregat, sortint.");
      return;
    }

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Debug.error("⚠️ WidgetsViewCtrl encara no està registrat! Es retarda loadData().", null);
      return;
    }

    ViewController ctrl = controller;
    Exception? exc;

    // Debug.info(("WidgetsViewData.loadData() async [2]");
    setPreparing(ctrl);

    List<ImageAndSize> imgs = [
      ImageAndSize(targetId: WidgetsViewCtrl.btnA, key: "add_location", source: Icons.add_location, width: 24.0.h, height: 24.0.h),
      ImageAndSize(targetId: WidgetsViewCtrl.btnB, key: "align_vertical_bottom_outlined", source: Icons.align_vertical_bottom_outlined, width: 24.0.h, height: 24.0.h),
      ImageAndSize(targetId: WidgetsViewCtrl.imgpd, key: "psicodex", source: "assets/images/psico_dex.png", width: 60.0.h, height: 60.0.h)
    ];
    
    stLoadImages(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        await LdImageController.instance.loadImages(this, imgs);
      } on Exception catch (pExc) {
        Debug.error("⚠️ Error en loadImages():", pExc);
        exc = pExc;
      }
      return exc;
    }
    sneakFn(stLoadImages);

    // stLoadImageA(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
    //   try {
    //     await LdImageController.instance.loadImage("add_location", pTargetId: 2_000, pIcon: Icons.add_location, pWidth: 20.0.h, pHeight: 20.0.h);
    //     stLoadImageB(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
    //       try {
    //         await LdImageController.instance.loadImage("align_vertical_bottom_outlined", pTargetId: 2_001, pIcon: Icons.align_vertical_bottom_outlined, pWidth: 20.0.h, pHeight: 20.0.h);            
    //       } on Exception catch (pExc) {
    //         exc = pExc;
    //       }
    //       return exc;
    //     }
    //     sneakFn(stLoadImageB);
    //   } on Exception catch (pExc) {
    //     exc = pExc;
    //   }
    //   return exc;
    // }
    // sneakFn(stLoadImageA);

    setLoading(ctrl);

    await runSteps().timeout(Duration(seconds: 5), onTimeout: () {
      Debug.error("Timeout a runSteps()! S'està bloquejant la càrrega?", null);
      return ([], Exception("Timeout a la càrrega de dades"));
    }).then((pLExc) {
      setLoaded(ctrl, pLExc.$2);
    });

    // Debug.info(("WidgetsViewData.loadData() - Finalitzat correctament");
  }

  // GETTERS i SETTERS ----------------
  @override
  ViewController get controller {
    // Debug.info(("WidgetsViewData.controller [getter]");

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Debug.error("⚠️ WidgetsViewCtrl encara no està registrat!", null);
      throw Exception("WidgetsViewCtrl encara no està registrat en el moment de la crida.");
    }

    return Get.find<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className);
  }
}
