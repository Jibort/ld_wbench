// Magatzem d'imatges de l'aplicació.
// CreatedAt: 2025/01/21 dt. JIQ

import "dart:ui" as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';

// Imatges per defecte.
const No_Image = "no_image";

class LdImageController extends GetxController {
  static final LdImageController instance = Get.put(LdImageController()); // Singleton

  final Map<String, Rx<Image?>> _imgs = {}; // 🔥 Ara és reactiu per `Asset` i `IconData`

  /// Carrega una imatge des d'un asset o un IconData
  Future<void> loadImage(String pKey, {String? assetPath, IconData? icon, double pWidth = 32.0, double pHeight = 32.0}) async {
    Debug.info("LdImageController.loadImage() - Iniciant càrrega de: $pKey");

    if (_imgs.containsKey(pKey)) {
      Debug.info("LdImageController.loadImage() - Ja carregada: $pKey");
      return;
    }

    _imgs[pKey] = Rx<Image?>(null);

    try {
      if (assetPath != null) {
        Image loadedImage = Image.asset(assetPath, width: pWidth, height: pHeight);
        _imgs[pKey]?.value = loadedImage;
      } else if (icon != null) {
        _imgs[pKey]?.value = await _iconToImage(icon, pWidth, pHeight);
      }

      Debug.info("LdImageController.loadImage() - ✅ Imatge carregada: $pKey");
      update();
    } catch (e) {
      Debug.info("LdImageController.loadImage() - ❌ Error carregant $pKey, utilitzant No_Image.");
      _imgs[pKey]?.value = Image.asset("assets/No_Image.png", width: pWidth, height: pHeight);
    }
  }

  /// Recupera una imatge ja carregada
  Image? getStoredImage(String pKey, {double? pWidth, double? pHeight}) {
    Debug.info("getStoredImage() - Recuperant imatge: $pKey");
    Image? img = _imgs[pKey]?.value;

    if (img == null) {
      Debug.info("getStoredImage() - ⚠️ Imatge $pKey no trobada, retornant No_Image.");
      return Image.asset("assets/No_Image.png", width: pWidth, height: pHeight);
    }

    return img;
  }

  /// Converteix `IconData` en `Image`
  Future<Image> _iconToImage(IconData icon, double width, double height) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(fontSize: width, fontFamily: icon.fontFamily, color: Colors.black),
      ),
    );

    painter.layout();
    painter.paint(canvas, Offset.zero);
    final picture = recorder.endRecording();
    final img = await picture.toImage(width.toInt(), height.toInt());

    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    return Image.memory(buffer, width: width, height: height);
  }
}