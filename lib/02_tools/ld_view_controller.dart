// Abstracció d'un controlador GetXController per a totes les vistes de l'aplicació.
// CreatedAt: 2025/02/08 ds. JIQ

import 'package:flutter/widgets.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

abstract class LdViewController extends LdController {
  // MEMBRES --------------------------
  final LdViewState _state;               // Dades de la pàgina.
  final List<String> wgIds = <String>[];  // Llista d'identificadors de widgets a actualitzar.
  ThemeProvider? themeProvider;           // Proveïdor per a les actualitzacions del tema.

  // CONSTRUCTORS ---------------------
  LdViewController({ super.pId, required LdViewState pState })
    : _state = pState;

  // GETTERS/SETTINGS -----------------
  LdViewState get state => _state;

  // FUNCIONS ABSTRACTES --------------
  Widget buildView(BuildContext pContext);
  
  // IMPLEMENTACIÓ 'LdController' -----
  // Inicialitzacions del controlador de la vista prèvies a la seva renderització.
  @override
  @mustCallSuper
  void onInit() {
    Debug.debug(2, "${runtimeType.toString()}.onInit(): PRE LdController.onInit()");
    super.onInit();
    Debug.debug(2, "${runtimeType.toString()}.onInit(): POST LdController.onInit()");
  }

  // Inicialitzacions del controlador de la vista després de la seva renderització.
  @override
  @mustCallSuper
  void onReady() {
    Debug.debug(2, "${runtimeType.toString()}.onReady(): PRE LdController.onReady()");
    super.onReady();
    Debug.debug(2, "${runtimeType.toString()}.onReady(): POST LdController.onReady()");
  }

  // Tanca Stream's, neteja recursos i allibera memòria.
  @override
  @mustCallSuper
  void onClose() {
    Debug.debug(2, "${runtimeType.toString()}.onReady(): PRE LdController.onClose()");
    super.onClose();
    Debug.debug(2, "${runtimeType.toString()}.onReady(): POST LdController.onClose()");

  }

  // GESTIÓ DE WIDGETS ----------------
  void addWidgets(List<String> pWgIds) {
    for (var wgId in pWgIds) {
      if (!wgIds.contains(wgId)) {
        wgIds.add(wgId);
      } else {
        Debug.error("${runtimeType.toString()}.addWidgets(): widget ja existeix: '$wgId'", null);
      }
    }
  }

  void notify({List<String>? pTgts}) {
    Debug.debug(3, "${runtimeType.toString()}.notify(): Notificants Widgets...");
    List<String> tgts = pTgts ?? wgIds;
    _state.clock = !_state.clock;
    for (var wgId in tgts) {
      update([wgId], true);
    }
    Debug.debug(3, "${runtimeType.toString()}.notify(): ...Widgets notificats.");
  }

  // 
  void resetState() {
    _state.dataReset();
  }
}