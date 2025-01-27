// Magatzem d'imatges de l'aplicació.
// CreatedAt: 2025/01/21 dt. JIQ

// import "dart:ui" as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

// Imatges per defecte.
const No_Image = "no_image";


class LdImageController extends GetxController {
  static LdImageController instance = Get.put(LdImageController()); // Singleton
  final Map<String, Image> _imageCache = {};

  @override
  void onInit() {
    super.onInit();

    // 🔥 Afegim un debug per comprovar quan es crea la instància i què hi ha a _imageCache
    Debug.info("LdImageController.onInit() - Inicialitzant imatges");

    _imageCache["No_Image"] = Image.asset("assets/icons/no_image.png");

    Debug.info("LdImageController.onInit() - Imatges disponibles: ${_imageCache.keys.toList()}");
  }

  Image? getStoredImage(String key) {
    Debug.info("LdImageController.getStoredImage() - Buscant imatge: $key");
    Debug.info("LdImageController.getStoredImage() - Imatges actuals en _imageCache: ${_imageCache.keys.toList()}");

    return _imageCache[key];
  }

  Future<void> loadImage(
    String key, {
    int? targetId,
    String? assetPath,
    IconData? icon,
    double pWidth = 32.0,
    double pHeight = 32.0,
  }) async {
    Debug.info("LdImageController.loadImage() - Iniciant càrrega de: $key per targetId: $targetId");

    await Future.delayed(Duration(milliseconds: 300)); // Simulem una càrrega

    if (assetPath != null) {
      _imageCache[key] = Image.asset(assetPath, width: pWidth, height: pHeight);
    } else if (icon != null) {
      _imageCache[key] = Image.asset('assets/icons/default_icon.png', width: pWidth, height: pHeight);
      // 🔥 Aquí podries transformar IconData a una imatge, si cal
    } else {
      _imageCache[key] = Image.asset('assets/icons/no_image.png', width: pWidth, height: pHeight);
    }

    Debug.info("LdImageController.loadImage() - ✅ Imatge carregada correctament: $key");
    Debug.info("LdImageController.loadImage() - Imatges actuals en _imageCache: ${_imageCache.keys.toList()}");

    // 🔥 Si targetId és nul, actualitzem tots els GetBuilder
    if (targetId != null) {
      update([targetId]); // Només actualitza el GetBuilder específic
    } else {
      update(); // Actualitza tots els GetBuilder si no hi ha targetId específic
    }
  }
}



// class LdImageController extends GetxController {
//   static final LdImageController instance = Get.put(LdImageController()); // Singleton

//   final Map<String, Rx<Image?>> _imgs = {}; // 🔥 Ara és reactiu per `Asset` i `IconData`

//   /// Carrega una imatge des d'un asset o un IconData
//   Future<void> loadImage(String pKey, {String? assetPath, IconData? icon, double pWidth = 32.0, double pHeight = 32.0}) async {
//     Debug.info("LdImageController.loadImage() - Iniciant càrrega de: $pKey");

//     // Simulem una càrrega de la imatge (pot ser una API o un arxiu local)
//     await Future.delayed(Duration(milliseconds: 300));

//     // Afegim la imatge a la memòria cau
//     _imgs[pKey]?.value = Image.asset('assets/icons/$pKey.png');

//     Debug.info("LdImageController.loadImage() - ✅ Imatge carregada correctament: $pKey");

//     // 🔥 Assegurem que s'actualitza el `GetBuilder` associat
//     update();
//   }

//   // Future<void> loadImage(String pKey, {String? assetPath, IconData? icon, double pWidth = 32.0, double pHeight = 32.0}) async {
//   //   Debug.info("LdImageController.loadImage() - Iniciant càrrega de: $pKey");
//   //   if (_imgs.containsKey(pKey)) {
//   //     Debug.info("LdImageController.loadImage() - 🔄 Ja està carregada.");
//   //     return;
//   //   }
//   //   _imgs[pKey] = Rx<Image?>(null); // 🔥 Inicialitzem com a `null`, però no la retornarem com a vàlida
//   //   try {
//   //     if (assetPath != null) {
//   //       Image loadedImage = Image.asset(assetPath, width: pWidth, height: pHeight);
//   //       _imgs[pKey]?.value = loadedImage;
//   //     } else if (icon != null) {
//   //       _imgs[pKey]?.value = await _iconToImage(icon, pWidth, pHeight);
//   //     }
//   //     Debug.info("LdImageController.loadImage() - ✅ Imatge carregada correctament: $pKey");
//   //     update();
//   //   } catch (e) {
//   //     Debug.info("LdImageController.loadImage() - ❌ Error carregant $pKey, assignant No_Image.");
//   //     _imgs[pKey]?.value = Image.asset("assets/No_Image.png", width: pWidth, height: pHeight);
//   //   }
//   // }

//   /// Recupera una imatge ja carregada
//   Image? getStoredImage(String pKey, {double? pWidth, double? pHeight}) {
//     Debug.info("LdImageController.getStoredImage() - Recuperant imatge: $pKey");

//     if (!_imgs.containsKey(pKey)) {
//       Debug.info("LdImageController.getStoredImage() - ⚠️ Clau $pKey no trobada, retornant No_Image.");
//       return Image.asset("assets/No_Image.png", width: pWidth, height: pHeight);
//     }

//     Image? img = _imgs[pKey]?.value;
//     if (img == null) {
//       Debug.info("LdImageController.getStoredImage() - ⚠️ La imatge $pKey encara no està disponible.");
//     } else {
//       Debug.info("LdImageController.getStoredImage() - ✅ Imatge trobada per $pKey");
//     }

//     return img;
//   }

//   /// Converteix `IconData` en `Image`
//   // Future<Image> _iconToImage(IconData icon, double width, double height) async {
//   //   final recorder = ui.PictureRecorder();
//   //   final canvas = Canvas(recorder);
//   //   final painter = TextPainter(
//   //     textDirection: TextDirection.ltr,
//   //     text: TextSpan(
//   //       text: String.fromCharCode(icon.codePoint),
//   //       style: TextStyle(fontSize: width, fontFamily: icon.fontFamily, color: Colors.black),
//   //     ),
//   //   );
//   //   painter.layout();
//   //   painter.paint(canvas, Offset.zero);
//   //   final picture = recorder.endRecording();
//   //   final img = await picture.toImage(width.toInt(), height.toInt());
//   //   final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
//   //   final buffer = byteData!.buffer.asUint8List();
//   //   return Image.memory(buffer, width: width, height: height);
//   // }
// }