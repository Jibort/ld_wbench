// Abstracció d'un controlador GetXController per a tots els widgets de l'aplicació.
// CreatedAt: 2025/02/08 ds. JIQ

import 'package:flutter/widgets.dart';
import 'package:ld_wbench/02_tools/index.dart';

class LdWidgetController extends LdController {
  // MEMBRES --------------------------
  String  _label;                 // Etiqueta localitzada del widget.
  int?    _errorCode;             // Codi d'error associat al widget.
  String? _errorMessage;          // Missatge d'error associat al widget.
  final FocusNode _focusNode;     // Gestor del focus pel widget.
  bool _isEnabled;                // Determina si el widget pot set ocupat pel focus.
  bool _isMandatory;              // Determina si el widget és de compliment obligatori.
  bool _isVisible;                // Determina si el widget és visible.
  bool _isPrimary;                // Determina la importància del widget.
  final LdViewController _vCtrl;  // Controlador de la vista on es troba el widget.
  final VoidCallback? _onPressed; // Callback per l'event 'click' al widget.
  
  // FUNCIONS ABSTRACTES --------------
  @mustCallSuper
  Widget buildWidget(BuildContext pContext) { return Container(); }

  // CONSTRUCTORS ---------------------
  LdWidgetController({
    super.pId,
    String  pLabel = '',
    int?    pErrorCode,
    String? pErrorMessage,
    bool pIsEnabled = true, 
    bool pIsMandatory = false, 
    bool pIsVisible = true,
    bool pIsPrimary = true,
    FocusNode? pFocusNode,
    required LdViewController pVCtrl,
    VoidCallback? pOnPressed,
  }):
    _label        = pLabel,
    _errorCode    = pErrorCode,
    _errorMessage = pErrorMessage,
    _isEnabled    = pIsEnabled,
    _isMandatory  = pIsMandatory,
    _isVisible    = pIsVisible,
    _isPrimary    = pIsPrimary,
    _focusNode    = pFocusNode?? FocusNode(),
    _vCtrl        = pVCtrl,
    _onPressed    = pOnPressed;

  // GETTERS/SETTERS ------------------
  String  get label        => _label;
  int?    get errorCode    => _errorCode;
  String? get errorMessage => _errorMessage;
  bool    get isEnabled    => _isEnabled;
  bool    get isMandatory  => _isMandatory;
  bool    get isVisible    => _isVisible;
  bool    get isPrimary    => _isPrimary;
  FocusNode get focusNode  => _focusNode;
  bool    get hasFocus     => _focusNode.hasFocus;
  LdViewController get vCtrl  => _vCtrl;
  VoidCallback? get onPressed => _onPressed;

  set isEnabled(bool pIsEnabled) {
     _isEnabled = pIsEnabled;
     _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set isMandatory(bool pIsMandatory) {
      _isMandatory = pIsMandatory;
      _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set isVisible(bool pIsVisible) {
      _isVisible = pIsVisible;
      _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set isPrimary(bool pIsPrimary) {
      _isPrimary = pIsPrimary;
      _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set label(String pLabel) {
    _label = pLabel;
    _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set errorCode(int? pErrorCode) {
    _errorCode = pErrorCode;
    _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  set errorMessage(String? pErrorMsg) {
    _errorMessage = pErrorMsg;
    _vCtrl.notify(pTgts: [xCtrl.id]);
  }

  // IMPLEMENTACIÓ D'ABSTRACTES -------
  // Inicialitzacions del controlador del widget prèvies a la seva renderització.
  @override
  @mustCallSuper
  void onInit() {
    Debug.debug(2, "${runtimeType.toString()}.onInit(): PRE LdController.onInit()");
    super.onInit();
    Debug.debug(2, "${runtimeType.toString()}.onInit(): POST LdController.onInit()");
  }

  // Inicialitzacions del controlador del widget després de la seva renderització.
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
}

