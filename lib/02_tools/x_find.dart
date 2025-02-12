// Substitució de Get.find() per a assegurar trobar els controladors.

import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

class XFind {
  static dynamic findByTag(String tag) {
    Debug.debug(1, "Interceptant Get.findByTag amb tag: $tag");

    // 1️⃣ Si GetX ja té el controlador registrat, el retorna directament
    if (Get.isRegistered(tag: tag)) {
      Debug.debug(1, "GetX ja té el controlador amb tag '$tag', retornant-lo.");
      return Get.find(tag: tag);
    }

    // 2️⃣ Si no està registrat a GetX, comprovem XReg
    if (XReg.inst.isRegisteredTag(tag)) {
      Debug.debug(1, "El controlador amb tag '$tag' està registrat a XReg, afegint-lo a GetX.");
      final controller = XReg.inst.getByTag(tag);
      Get.put(controller, tag: tag);
      return controller;
    }

    // 3️⃣ Si no existeix enlloc, intentem crear-lo (opcional)
    Debug.debug(1, "No s'ha trobat cap controlador amb tag '$tag'.");
    throw Exception("No s'ha trobat cap controlador registrat amb tag '$tag'.");
  }
}
