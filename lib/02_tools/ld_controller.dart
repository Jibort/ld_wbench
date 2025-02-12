// Abstracció d'un controlador GetXController per a tota l'aplicació.
// CreatedAt: 2025/02/08 ds. JIQ

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

abstract class LdController extends GetxController {
  // MEMBRES --------------------------
  late final XCtrl _xCtrl;

  // CONSTRUCTORS ---------------------
  LdController({ String? pId }) {
    _xCtrl = XCtrl(pType: runtimeType); // , pId: pId?? runtimeType.toString());
    XReg.inst.register(this);  // ✅ Auto-registre immediat
    Debug.debug(2, "${runtimeType.toString()}.(${xCtrl.tag}): Controlador enregistrat?: ${XReg.inst.isRegistered(this)}");
  }

  // GETTERS/SETTERS ------------------
  XCtrl  get xCtrl => _xCtrl;
  Type   get type  => _xCtrl.type;
  String get id    => _xCtrl.id;
  String get tag   => _xCtrl.tag;

  // IMPLEMENTACIÓ D'ABSTRACTES -------
  // Tanca Stream's, neteja recursos i allibera memòria.
  @override
  @mustCallSuper
  void onClose() {
    XReg.inst.unregister(this);  // ✅ Auto-desregistre en el moment adequat
    Debug.debug(2, "${runtimeType.toString()}.(${xCtrl.tag}): Controlador desenregistrat?: ${!XReg.inst.isRegistered(this)}");
    super.onClose();
  }
}