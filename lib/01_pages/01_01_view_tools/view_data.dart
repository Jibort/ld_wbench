// Classe magatzem general per a vistes.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';

abstract class ViewData extends DeepDo {
  // MEMBRES --------------------------
  // Estat de la càrrega de la pàgina.
  LoadState _loadState = LoadState.isNew;

  // Comptador de càrregues de dades.
  int _loadCounter = 0;
  
  bool clock = false;
  Exception? _exception;

  // Dades genèriques de les vistes.
  late final String _title;
  late final String? _message;
  late final String? _errorCode;
  late final String? _errorMessage;

  // CONSTRUCTORS ---------------------
  ViewData({
   required String pTitle,
   required String pMsg,
   String? pErrorCode, String? pErrorMessage,
   Exception? pException}):
    _title = pTitle,
    _message = pMsg,
    _errorCode = pErrorCode,
    _errorMessage = pErrorMessage,
    _exception = pException,
    super(null) {
      // Debug.info(("ViewData(...) [constructor]");
  }

  // GETTERS i SETTERS ----------------
  String get title => _title;
  String? get message => _message;
  String? get errorCode => _errorCode;
  String? get errorMessage => _errorMessage;
  Exception? get exception => _exception;

  // Retorna el controllador de les dades de la vista.
  ViewController get controller;

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
  void setPreparing(ViewController pCtrl) {
    _loadState = (_loadCounter == 0) ? LoadState.isPreparing : LoadState.isPreparingAgain;
    pCtrl.notify(pTargets: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'està executant.
  void setLoading(ViewController pCtrl) {
    _loadState = (_loadCounter == 0) ? LoadState.isLoading : LoadState.isLoadingAgain;
    pCtrl.notify(pTargets: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // EINES DE CÀRREGA -----------------
  // Carrega les dades de la vista on es trobi.
  void loadData();
  
  
  // Estableix que la càrrega s'ha completat.
  void setLoaded(ViewController pCtrl, Exception? pExc) {
    _exception = pExc;

    _loadState = LoadState.isLoaded;
    _loadCounter += 1;
    pCtrl.notify();
  }

  // Estableix que la càrrega s'està tornant a preparar.
  void setPreparingAgain(ViewController pCtrl) {
    _loadState = LoadState.isPreparingAgain;
    pCtrl.notify(pTargets: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'està tornant a executar.
  void setLoadingAgain(ViewController pCtrl) {
    _loadState = LoadState.isLoadingAgain;
    pCtrl.notify(pTargets: [WidgetKey.appBar.idx, WidgetKey.appBarProgress.idx]);
  }

  // Estableix que la càrrega s'ha completat amb error.
  void setException(
   ViewController pCtrl,
   String? pError, String? pErrorMessage,
   Exception pExc) {
    _exception = pExc;
    _loadState = LoadState.isError;
    _errorCode = pError;
    _errorMessage = pErrorMessage;
    pCtrl.notify();
  }

  // Reinicia l'estat original de càrrega.
  void dataReset(ViewController pCtrl) {
    super.reset();
    _exception = null;
    _loadState = LoadState.isNew;
    _loadCounter = 0;
    loadData();
    pCtrl.notify();
  }
}

