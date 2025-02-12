// Classe magatzem general per a vistes.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:flutter/foundation.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';

abstract class LdViewState extends DeepDo {
  // MEMBRES --------------------------
  LoadState _loadState = LoadState.isNew; // Estat de la càrrega de la pàgina.
  int _loadCounter = 0;                   // Contador de càrregues.
  bool clock = false;
  Exception? _exception;
  late final LdViewController _viewCtrl;  // Controlador de la vista.

  // Dades genèriques de les vistes.
  late final String  _title;
  late final String? _message;
  late final String? _errorCode;
  late final String? _errorMessage;

  // CONSTRUCTORS ---------------------
  LdViewState({
   required String pTitle, required String pMsg,
   String? pErrorCode, String? pErrorMessage,
   Exception? pException}):
    _title = pTitle,
    _message = pMsg,
    _errorCode = pErrorCode,
    _errorMessage = pErrorMessage,
    _exception = pException,
    super(null);
    
  // GETTERS i SETTERS ----------------
  String get title => _title;
  String? get message => _message;
  String? get errorCode => _errorCode;
  String? get errorMessage => _errorMessage;
  Exception? get exception => _exception;

  // Retorna el controllador de les dades de la vista.
  LdViewController get viewCtrl => _viewCtrl;
  set viewCtrl(LdViewController pVCtrl) => _viewCtrl = pVCtrl;

  // Retorna el número de cops que s'ha executat la càrrega.
  int get loadCounter => _loadCounter;

  // Només cert quan el control·lador ha de començar a carregar dades.
  @override
  bool get isNew => (_loadState == LoadState.isNew);

  // Només cert quan s'està preparant la càrrega.
  @override
  bool get isPreparing => (_loadState == LoadState.isPreparing);

  // Només cert quan s'està carregant dades.
  @override
  bool get isLoading => (_loadState == LoadState.isLoading);

  // Només cert quan les dades han estat carregades.
  @override
  bool get isLoaded => (_loadState == LoadState.isLoaded);

  // Només cert quan s'està tornant a preparar una càrrega.
  @override
  bool get isPreparingAgain => (_loadState == LoadState.isPreparingAgain);

  // Només cert quan s'està tornant a carregar dades.
  @override
  bool get isLoadingAgain => (_loadState == LoadState.isLoadingAgain);

  // Només cert quan ha succeït una excepció en la càrrega de dades.
  @override
  bool get isError => (_loadState == LoadState.isError);

// Estableix que la càrrega s'està preparant.
  void setPreparing() {
    _loadState = (_loadCounter == 0) ? LoadState.isPreparing : LoadState.isPreparingAgain;
    _viewCtrl.notify(pTgts: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'està executant.
  void setLoading() {
    _loadState = (_loadCounter == 0) ? LoadState.isLoading : LoadState.isLoadingAgain;
    _viewCtrl.notify(pTgts: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // EINES DE CÀRREGA -----------------
  // Carrega les dades de la vista on es trobi.
  @mustCallSuper
  void loadData();
  
  
  // Estableix que la càrrega s'ha completat.
  void setLoaded(Exception? pExc) {
    _exception = pExc;

    _loadState = LoadState.isLoaded;
    _loadCounter += 1;
    _viewCtrl.notify();
  }

  // Estableix que la càrrega s'està tornant a preparar.
  void setPreparingAgain() {
    _loadState = LoadState.isPreparingAgain;
    viewCtrl.notify(pTgts: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'està tornant a executar.
  void setLoadingAgain() {
    _loadState = LoadState.isLoadingAgain;
    _viewCtrl.notify(pTgts: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'ha completat amb error.
  void setException(
   String? pError, String? pErrorMessage,
   Exception pExc) {
    _exception = pExc;
    _loadState = LoadState.isError;
    _errorCode = pError;
    _errorMessage = pErrorMessage;
    _viewCtrl.notify();
  }

  // Reinicia l'estat original de càrrega.
  void dataReset() {
    super.reset();
    _exception = null;
    _loadState = LoadState.isNew;
    _loadCounter = 0;
    loadData();
    _viewCtrl.notify();
  }
}

