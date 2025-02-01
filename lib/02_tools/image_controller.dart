// Magatzem d'imatges de l'aplicació.
// CreatedAt: 2025/01/21 dt. JIQ

import "dart:ui" as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';

import '../06_theme/app_theme.dart';

// Imatges per defecte.
const No_Image = "no_image";


class LdImageController extends GetxController {
  static LdImageController instance = Get.put(LdImageController()); // Singleton
  final Map<String, Image> _imgs = {};

  // CONSTRUCTORS ---------------------
  LdImageController() {
    // _imgs[No_Image] = Image.asset("assets/No_Image.png");
  }

  @override
  void onInit() {
    super.onInit();

    // 🔥 Afegim un debug per comprovar quan es crea la instància i què hi ha a _imageCache
    // Debug.info(("LdImageController.onInit() - Inicialitzant imatges");

    _imgs["No_Image"] = Image.asset("assets/No_Image.png");

    // Debug.info(("LdImageController.onInit() - Imatges disponibles: ${_imgs.keys.toList()}");
  }

  Image? getStoredImage(String key) {
    // Debug.info(("LdImageController.getStoredImage() - Buscant imatge: $key");
    // Debug.info(("LdImageController.getStoredImage() - Imatges actuals en _imageCache: ${_imgs.keys.toList()}");

    return _imgs[key];
  }

  void forgetImage(String pKey) {
    Image? img = _imgs[pKey];
    if (img != null) {
      _imgs.remove(pKey);
    }
  }

  Future<void> loadImage(
    String pKey, {
    List<int>? pTgts,
    String? pAsset,
    IconData? pIcon,
    double? pWidth,
    double? pHeight,
  }) async {
    pWidth ??= defIconWidth;
    pHeight??= defIconHeight;
      
    if (pAsset != null) {
      try {
        _imgs[pKey] = Image.asset(pAsset, width: pWidth, height: pHeight);
      } catch (e) {
        _imgs[pKey] = _imgs["No_Image"]!;
      }
    } else if (pIcon != null) {
      try {
        _imgs[pKey] = await _renderIconToImage(pIcon, pWidth, pHeight);
      } catch (e) {
        _imgs[pKey] = _imgs["No_Image"]!;
      }
    } else {
      _imgs[pKey] = _imgs["No_Image"]!;
    }

    if (pTgts != null && pTgts.isNotEmpty) {
      update(pTgts);
    } else {
      update();
    }
  }

  Future<Image> _renderIconToImage(IconData icon, double width, double height) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(fontSize: width, fontFamily: icon.fontFamily),
      ),
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);

    final picture = recorder.endRecording();
    final ui.Image img = await picture.toImage(width.toInt(), height.toInt());

    final ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes = byteData!.buffer.asUint8List();

    return Image.memory(imageBytes, width: width, height: height);
  }

  /// Aquesta funció simplifica la codificació per a la càrrega de una llissta d'imatges.
  Future<void> loadImages(DeepDo pDo, List<ImageAndSize> pImgs) async {
    for (var idx = 0; idx < pImgs.length; idx++) {
      ImageAndSize img = pImgs[idx];
      step(FiFo pQueue, List<dynamic> pArgs) async {
        if (img.source is IconData) {
          await loadImage(img.key, pTgts: img.tgts, pIcon: img.source, pWidth: img.width, pHeight: img.height);
        } else {
          await loadImage(img.key, pTgts: img.tgts, pAsset: img.source, pWidth: img.width, pHeight: img.height);
        }      
      }
      pDo.sneakFn(step);
    }
  }
}

class ImageAndSize {
  String key;
  dynamic source;
  double width, height;
  List<int> tgts;

  ImageAndSize({required this.key, required this.source, required this.width, required this.height, required this.tgts});
}

