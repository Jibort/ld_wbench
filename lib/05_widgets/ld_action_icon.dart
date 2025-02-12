// Widget 'ActionIcon'.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

/// LdIconAction: Un ActionButton estilitzat per al projecte, basat en LdWidget.
/// Pot mostrar una icona basada en [IconData] o en un asset.
class LdActionIcon extends LdWidget {
  dynamic imgId;
  Image?  img;
  final double? size;
  final bool isCircular;

  LdActionIcon({
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
    this.isCircular = true,
    this.size,
    FocusNode? pFocusNode,
    VoidCallback? pOnPressed,
    required LdViewController pVCtrl,
  }): super(pWCtrl: LdWidgetController(
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
  ));

  @override
  // ignore: unnecessary_overrides
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  Widget buildContent(BuildContext context) {
    return GetBuilder<LdImageController>( // GetBuilder<LdImageController>(
      id: xCtrl.id,
      builder: (controller) {
        if (imgId == null) {
          return _buildButton(context, null);
        }

        Image? img = controller.getStoredImage(imgId);
        if (img == null) {
          controller.loadImageFromRef(
            imgId,
            pTgts: [xCtrl.id],
            pWidth: defIconWidth,
            pHeight: defIconHeight,
          );

          return _buildButton(context, null);
        }

        return _buildButton(context, img);
      },
    );
  }

  Widget _buildButton(BuildContext context, Image? icon) {
    final bgColor = isEnabled ? Colors.transparent: Colors.grey.shade600;
                        // isDanger ? Colors.redAccent :
                        // isPrimary ? theme.colorScheme.primary :
                        // theme.colorScheme.secondary;
    final fgColor = isEnabled ? Colors.black: Colors.grey; 
                        // isDanger || isPrimary ? theme.colorScheme.onPrimary :
                        // theme.colorScheme.onSecondary;

    return InkWell(
      onTap: isEnabled? wCtrl.onPressed: null,
      borderRadius: BorderRadius.circular(isCircular ? size! / 2 : 8.0),
      child: Container(
        width: size!,
        height: size!,
        decoration: BoxDecoration(
          color: bgColor,
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Center(
          child: icon != null
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(fgColor, BlendMode.srcIn),
                  child: icon,
                )
              : Container(),
        ),
      )
    );
  }
}
