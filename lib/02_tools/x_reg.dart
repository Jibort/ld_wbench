// Classe per a la gestió simplificada del registre de controladors.
// CreatedAt: 2025/02/08 ds. JIQ

import 'dart:io';

import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

class XReg {
  // Instáncia global.
  static XReg inst = XReg();

  // MEMBRES --------------------------
  // Mapa de controladors enregistrats.
  final Map<String, LdController> _map = <String, LdController>{};

  // GESTIÓ DIRECTA DE CONTROLADORS ---
  void register(LdController pInst) {
    Debug.debug(4, "XReg.register('$pInst)(${pInst.runtimeType.toString()})");
    if (!isRegisteredTag(pInst.tag)) {
      Debug.debug(4, "XReg.register('${pInst.tag}')");
      Get.put(pInst, tag: pInst.tag, permanent: true);
      while (isRegisteredTag(pInst.tag)) {
        sleep(Duration(milliseconds: 100));
      } 
      _map[pInst.tag] = pInst;
    }
  }

  bool unregister(LdController pInst) {
    return unregisterTag(pInst.tag) != null;
  }

  bool isRegistered(LdController pInst) {
    return isRegisteredTag(pInst.tag);
  }

  LdController? get(XCtrl pCtrl) {
    if (pCtrl.tag == "LdImageController") return LdImageController.inst;
    return getByTag(pCtrl.tag);
  }
  
  LdController? _getFind(String pTag) {
    LdController? ctrl;
    bool found = true;
    try {
      ctrl = Get.find(tag: pTag);
    } catch (e) { found = false; }
    return found? ctrl: null;
  }

  // GESTIÓ A TRAVÉS DE 'tag'  --------
  LdController? unregisterTag(String pTag) {
    if (!isRegisteredTag(pTag)) return null;
    LdController? ctrl = _getFind(pTag);
    if (ctrl != null) { Get.delete(tag: pTag, force: true); }
    LdController? tctrl = _map.remove(pTag);
    return tctrl;  // Retorna la instància eliminada
  }

  bool inMap(String pTag) {
    return _map.containsKey(pTag);
  }
  bool isRegisteredTag(String pTag) {
    if (pTag == "LdImageController") return true;
    return inMap(pTag) || Get.isRegistered(tag: pTag);
  }

  LdController? getByTag(String pTag) {
    LdController? ctrl;
    if (pTag == "LdImageController") return LdImageController.inst;
    if (inMap(pTag)) {
      ctrl = _map[pTag];
    }
    return ctrl;
  }
  
  // Llista els controladors enregistrats en el log.
  void logRegisteredCtrls() {
    Debug.debug(1, "Controladors enregistrats...");
    int cnt = 0;

    for (var tag in _map.keys) {
      LdController? ctrl = _getFind(tag);
      bool found = (ctrl != null);
      ctrl = _map[tag];
      Debug.debug(1, "[${(++cnt).toString().padLeft(3, '0')}, $found]  '${ctrl!.xCtrl.tag}')");
    }
    Debug.debug(1, "...Controladors enregistrats");
  }
}
