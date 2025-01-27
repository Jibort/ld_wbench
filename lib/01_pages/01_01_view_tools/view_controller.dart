// Emcapsulament dels control·ladors oferts per GetX.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: unnecessary_overrides, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

// Classe base de tots els control·ladors de pàgines de l'aplicació.
abstract class ViewController extends GetxController {
  // MEMBRES --------------------------
  // Proveïdor per a les actualitzacions del tema.
  ThemeProvider? themeProvider;

  // Mapa per controlar l'estat de focus de cada camp
  final Map<int, bool> _focusStatus = {};
  Map<int, bool> get focusStatus => _focusStatus;

  // Dades de la pàgina.
  ViewData? _state;

  // Llista d'identificadors de widgets a actualitzar.
  final List<int> wgIds = <int>[];

  // CONSTRCTORS ----------------------
  ViewController({
    required String pTitle,
    required String pMsg,
    String? pErrorCode, String? pErrorMessage,
    Exception? pException}) {
      Debug.info("ViewController(...) [constructor]");
      //_state = pConstr(pCtrl: this, pTitle: pTitle, pMsg: pMsg, pErrorCode: pErrorCode, pErrorMessage: pErrorMessage); 
  }

  // GETTERS i SETTERS ----------------
  // Retorna la instància de ViewData.
  ViewData get state {
    if (_state == null ) {
      Debug.fatal("ViewController.state [getter]: L'estat encara no ha estat establert", null);
    }

    return _state!;
  }

  // Estableix la instànciade ViewData.
  set state(ViewData pData) {
    _state = pData;
  }

  // Retorna l'excepció que ha succeït en la càrrega de dades.
  Exception? get exception {
    if (_state == null ) {
      Debug.fatal("ViewController.exception [getter]: L'estat encara no ha estat establert", null);
    }

    return _state!.exception;
  }


  
  // GESTIÓ DEL LLISTAT DE WIDGETS ----
  void addWidgets(List<dynamic> pWgIds) {
    for (dynamic wgId in pWgIds) {
      if (wgId is int) {
        if (!wgIds.contains(wgId)) wgIds.add(wgId);
      } else if (wgId is WidgetKey) {
        if (!wgIds.contains(wgId.index)) wgIds.add(wgId.idx);
      }
    }
  }

// ACTUALITZACIÓ DELS GETBUILDERS ---
  void notify({List<int>? pTargets}) {
    List<int> targets = pTargets ?? wgIds;
    if (_state != null) { _state!.clock = !_state!.clock; }
    for (int wgId in targets) {
      update([wgId], true);
    }
  }

  // FUNCIONS ABSTRACTES --------------
  Widget buildWidget(BuildContext pContext);
  void viewReset() {
    if (_state == null ) {
      Debug.fatal("ViewController.buildWidget(BuildContext): L'estat encara no ha estat establert", null);
    }

    _state!.dataReset(this);
  }	

  // CICLE DE VIDA DEL CONTROLADOR ----
  @override
  void onInit() {
    super.onInit();
    addWidgets([WidgetKey.appBar, WidgetKey.appBarProgress]);
    Debug.info("$runtimeType - onInit()");
  }

  @override
  void onReady() {
    super.onReady();
    Debug.info("$runtimeType - onReady()");
    state.loadData();  // Només es crida una vegada, després que la vista estigui llesta
  }
  
  @override
  void onClose() {
    super.onClose();

    final String ctrlTag = runtimeType.toString();
      Debug.info("🗑 onClose() de 'ViewController' amb tag $ctrlTag");
  }

  @override
  void dispose() {
    super.dispose();
    
    final String ctrlTag = runtimeType.toString();
    Debug.info("🗑 dispose() de 'ViewController' amb tag $ctrlTag");
  }


  // Funció per actualitzar l'estat de focus
  void setFocusStatus(int pFieldId, bool isFocused) {
    _focusStatus[pFieldId] = isFocused;
    notify(pTargets: [pFieldId]);
  }
}
