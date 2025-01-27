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
    Debug.info("WidgetsViewData.createInstance(ViewController, ...)");
  
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
    Debug.info("WidgetsViewData(title, msg, errorCode, errorMessage)");
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
    Debug.info("WidgetsViewData.loadData() async [1]");

    if (!isNew) {
      Debug.info("⚠️ Ja carregat, sortint.");
      return;
    }

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Debug.error("⚠️ WidgetsViewCtrl encara no està registrat! Es retarda loadData().", null);
      return;
    }

    ViewController ctrl = controller;
    Exception? exc;

    Debug.info("WidgetsViewData.loadData() async [2]");
    setPreparing(ctrl);

    stLoadImage(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        await LdImageController.instance.loadImage("Add_Location", targetId: 2_000, icon: Icons.add_location, pWidth: 20.0.h, pHeight: 20.0.h);
        
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }
    await addFnNow(controller, stLoadImage);

    setLoading(ctrl);

    await runSteps().timeout(Duration(seconds: 5), onTimeout: () {
      Debug.error("Timeout a runSteps()! S'està bloquejant la càrrega?", null);
      return ([], Exception("Timeout a la càrrega de dades"));
    }).then((pLExc) {
      setLoaded(ctrl, pLExc.$2);
    });

    Debug.info("WidgetsViewData.loadData() - Finalitzat correctament");
  }

  // GETTERS i SETTERS ----------------
  @override
  ViewController get controller {
    Debug.info("WidgetsViewData.controller [getter]");

    if (!Get.isRegistered<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className)) {
      Debug.error("⚠️ WidgetsViewCtrl encara no està registrat!", null);
      throw Exception("WidgetsViewCtrl encara no està registrat en el moment de la crida.");
    }

    return Get.find<WidgetsViewCtrl>(tag: WidgetsViewCtrl.className);
  }
}
