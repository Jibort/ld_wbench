// Classe per a la gestió simplificada del registre de controladors.
// CreatedAt: 2025/02/08 ds. JIQ

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

class XReg {
  // Instáncia global.
  static XReg inst = XReg();

  // MEMBRES --------------------------
  // Mapa de controladors enregistrats.
  final LiFo<XCtrl> _sorted = LiFo<XCtrl>();

  // GESTIÓ DIRECTA DE CONTROLADORS ---
  void register(LdController pInst) {
    if (!isRegisteredTag(pInst.tag)) {
      WidgetsBinding.instance.addPostFrameCallback((_) { 
        Get.put(pInst, tag: pInst.tag, permanent: true);
      });
      if (!_sorted.list.any((x) => x.tag == pInst.tag)) {
        _sorted.push(pInst.xCtrl);
      }
    }
  }

  bool unregister(LdController pInst) {
    return unregisterTag(pInst.tag) != null;
  }

  bool unregisterUntil(LdController pInst) {
    return unregisterUntilTag(pInst.tag);
  }

  bool isRegistered(LdController pInst) {
    return isRegisteredTag(pInst.tag);
  }

  LdController? get(XCtrl pCtrl) {
    return (isRegisteredTag(pCtrl.tag))
      ? Get.find(tag: pCtrl.tag)
      : null;
  }
  
  // GESTIÓ A TRAVÉS DE 'tag'  --------
  LdController? unregisterTag(String pTag) {
    if (!isRegisteredTag(pTag)) return null;
    LdController ctrl = Get.find(tag: pTag);
    Get.delete(tag: pTag, force: true);
    _sorted.remove(ctrl.xCtrl);
    return ctrl;  // Retorna la instància eliminada
  }

  bool unregisterUntilTag(String pTag) {
    XCtrl? xctrl;
    bool found = false;

    if (!isRegisteredTag(pTag)) return false; 

    do {
      xctrl = _sorted.pop();
      if (xctrl != null) {
        found = true;
        Get.delete(tag: xctrl.tag, force: true);
      }
    } while (xctrl != null && xctrl.tag != pTag);

    return found;
  }

  bool isRegisteredTag(String pTag) {
    return Get.isRegistered(tag: pTag);
  }

  LdController? getByTag(String pTag) {
    return (isRegisteredTag(pTag))
      ? Get.find(tag: pTag)
      : null;
  }
  
  // Llista els controladors enregistrats en el log.
  void logRegisteredCtrls() {
    Debug.debug(1, "Controladors enregistrats");
    int cnt = 0;
    for (var ctrl in _sorted.list) {
      var ex = isRegisteredTag(ctrl.tag);

      Debug.debug(1, "[${(++cnt).toString().padLeft(3, '0')}, $ex]  ${ctrl.type} ('${ctrl.tag}')");
    }
  }
}
