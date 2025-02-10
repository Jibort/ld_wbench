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


class LdImageController extends LdController {
  static LdImageController inst = LdImageController(); // Singleton
  final Map<String, Image> _imgs = {};

  // CONSTRUCTORS ---------------------
  LdImageController();

  // IMPLEMENTACIÓ DE 'LdController' --
  @override
  void onInit() {
    super.onInit();
    _imgs["No_Image"] = Image.asset("assets/No_Image.png");
  }

  bool exists(String? pKey) {
    return pKey != null && _imgs.containsKey(pKey);
  }

  Image? getStoredImage(String? key) {
    return (key != null) ? _imgs[key]: _imgs[No_Image];
    // return key != null ? _imgs[key] ?? _imgs[No_Image]!: _imgs[No_Image]!;
  }

  ColorFiltered getFilteredImage({String? pKey, bool pIsEnabled = true, bool pHasFocus = false, Color? pColor}) {
    Image? img = getStoredImage(pKey);
    if (pColor == null) {
        final theme = Theme.of(Get.context!);
        pColor = !pIsEnabled 
          ? Colors.grey
          : pHasFocus
            ?  theme.colorScheme.primary
            : theme.colorScheme.onSecondary;
      }

    if (img != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(pColor, BlendMode.srcIn),
        child: img,
      );
    }
    return ColorFiltered(
        colorFilter: ColorFilter.mode(pColor, BlendMode.srcIn),
        child: _imgs["No_Image"]!,
      );
  }

  void forgetImage(String pKey) {
    Image? img = _imgs[pKey];
    if (img != null) {
      _imgs.remove(pKey);
    }
  }

  Future<void> loadImageFromId(
    String pKey, {
    dynamic pRef,
    List<String>? pTgts,
    double? pWidth,
    double? pHeight
  }) {
    if (pRef is String) {
      return loadImage(pKey, pTgts: pTgts, pAsset: pRef, pWidth: pWidth, pHeight: pHeight);  
    } else if (pRef is IconData) {	
      return loadImage(pKey, pTgts: pTgts, pIcon: pRef, pWidth: pWidth, pHeight: pHeight);
    } else {
      Debug.error("LdImageController.loadImage(): 'pRef' no és String ni tampoc IconData", null);
      return Future.value();
    }
  }

  Future<void> loadImage(
    String pKey, {
    List<String>? pTgts,
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
          Debug.debug(1, "Demanant l'icona de: ${img.key} (${img.source})");
          await loadImage(img.key, pTgts: img.tgts, pIcon: img.source, pWidth: img.width, pHeight: img.height);
        } else {
          Debug.debug(1, "Demanant la imatge de: ${img.key} (${img.source})");
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
  List<String> tgts;

  ImageAndSize({required this.key, required this.source, required this.width, required this.height, required this.tgts});
}

