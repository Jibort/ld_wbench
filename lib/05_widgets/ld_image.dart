// Widget customitzat per a crear imattges a partir d'assets i/o icones.
// CreatedAt: 24-10-29 dt. JIQ

// ignore_for_file: must_be_immutable, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

class LdImage extends LdWidget {
  dynamic imgId;
  Image?  img;
  final double width;
  final double height;

  // CONSTRUCTORS --------------------
  LdImage({
    super.key,
    String? pId,
    this.imgId,
    String  pLabel = '',
    int?    pErrorCode,
    String? pErrorMessage,
    bool pIsEnabled = true, 
    bool pIsMandatory = false, 
    bool pIsVisible = true,
    bool pIsPrimary = true,
    double? pWidth , 
    double? pHeight, 
    FocusNode? pFocusNode,
    VoidCallback? pOnPressed,
    required LdViewController pVCtrl,
  }): width = pWidth?? defIconWidth, height = pHeight?? defIconHeight, 
  super(pWCtrl: LdWidgetController(
        pId: pId,
        pLabel: pLabel,
        pErrorCode: pErrorCode,
        pErrorMessage: pErrorMessage,
        pIsEnabled: pIsEnabled, 
        pIsMandatory: pIsMandatory, 
        pIsVisible: pIsVisible,
        pIsPrimary: pIsPrimary,
        pVCtrl: pVCtrl,
        pOnPressed: pOnPressed,
      )
  );


  // OVERRIDES ------------------------  
  @override
  Widget buildContent(BuildContext context) {
    return GetBuilder<LdImageController>(
      id: xCtrl.id,
      tag: imgId,
      init: LdImageController.inst,
      builder: (pCtrl) =>
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            hasFocus 
              ? Colors.orange //Theme.of(context).dividerColor
              : Colors.green[500]!, // fgColor, 
            BlendMode.srcIn),
          child: pCtrl.getStoredImage(imgId)
        ),
    );
  }
}