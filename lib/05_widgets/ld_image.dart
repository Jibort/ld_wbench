// Widget customitzat per a crear imattges a partir d'assets i/o icones.
// CreatedAt: 24-10-29 dt. JIQ

// ignore_for_file: must_be_immutable, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/image_controller.dart';
import 'package:ld_wbench/05_widgets/index.dart';

class LdImage extends LdWidget {
  final String imageKey;
  final double width;
  final double height;

  // CONSTRUCTORS ---------------------
  LdImage({required super.id, super.key, required super.bCxt, required this.imageKey, this.width = 24.0, this.height = 24.0});

  // OVERRIDES ------------------------  
  @override
  Widget buildContent(BuildContext context) {
    // final theme = Theme.of(context);
    // final fgColor = !isEnabled 
    // ? Colors.grey
    // : isFocused
    //   ?  theme.colorScheme.primary
    //   : theme.colorScheme.onSecondary;

    return GetBuilder<LdImageController>(
      id: id,
      tag: imageKey,
      init: LdImageController.instance,
      builder: (controller) {
        return ColorFiltered(
              colorFilter: ColorFilter.mode(
                focusNode.hasFocus 
                  ? Colors.orange //Theme.of(context).dividerColor
                  : Colors.green[500]!, // fgColor, 
                BlendMode.srcIn),
              child: controller.getStoredImage(imageKey) ?? Image.asset("assets/No_Image.png", width: width, height: height));
      },
    );
  }
  
  @override
  void dispose() {
    // Este widget no necesita liberar recursos explícitamente.
  }
}