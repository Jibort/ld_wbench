// Butó base per a l'aplicació Sabina.
// CreatedAt: 2025/01/19 dg. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
/// LdButton: Un botó estilitzat per al projecte, basat en LdWidget.
/// S'integra amb el tema definit i pot ser primari, secundari o de perill.
class LdButton extends LdWidget {
  // MEMBRES --------------------------
  dynamic imgKey;
  dynamic imgId;
  Image?  img;

  // CONSTRUCTORS ---------------------
  LdButton({
    super.key,
    String? pId,
    this.imgKey,
    this.imgId,
    String  pLabel = '',
    int?    pErrorCode,
    String? pErrorMessage,
    bool pIsEnabled = true, 
    bool pIsMandatory = false, 
    bool pIsVisible = true,
    bool pIsPrimary = true,
    FocusNode? pFocusNode,
    VoidCallback? pOnPressed,
    required LdViewController pVCtrl,
  }) : super(pWCtrl: LdWidgetController(
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

  @override
  Widget buildContent(BuildContext context) {
    return GetBuilder<LdImageController>(
      id: wCtrl.id,
      tag: imgId, 
      init: LdImageController.inst,
      builder: (pCtrl) => 
        GetBuilder<LdViewController>(
          id: wCtrl.vCtrl.id,
          tag: wCtrl.xCtrl.tag,
          init: wCtrl.vCtrl,
          builder: (pCxt) {
          if (imgKey == null) {
            return _buildButton(context, null);
          }

          img ??= pCtrl.getStoredImage(imgId!);
          if (img == null && imgId != null && imgKey != null) {
            pCtrl.loadImageFromRef(
              imgKey,
              pRef: imgId,
              pTgts: [wCtrl.id],
              pWidth: defIconWidth,
              pHeight: defIconHeight,
            );

            return _buildButton(context, null);
          }
          
          return _buildButton(context, img);
      },
    ));
  }

  /// 🔥 Mètode privat per encapsular la creació del botó
  Widget _buildButton(BuildContext context, Image? icon) {
    final theme = Theme.of(context);
    final bgColor = !isEnabled ? theme.colorScheme.surface.withValues(alpha: 0.5) :
                        isError ? Colors.redAccent :
                        isPrimary ? theme.colorScheme.primary :
                        theme.colorScheme.secondary;
    final fgColor = !isEnabled ? Colors.grey :
                        isError || isPrimary ? theme.colorScheme.onPrimary :
                        theme.colorScheme.onSecondary;
    final bdColor = !isEnabled ? theme.colorScheme.surface.withValues(alpha: 0.5) :
                        isError ? Colors.redAccent :
                        isPrimary ? theme.colorScheme.secondary :
                        theme.colorScheme.primary;
    
    return Container(
      padding: EdgeInsets.only(left: 5.0.h, right: 5.0.h, top: 15.0.h),
      child : Container(
      padding: EdgeInsets.all(0.0.h), // Espai entre la vora exterior i la interior
      decoration: BoxDecoration(
        border: Border.all(color: bdColor, width: 2.0.h), // Vora exterior
        borderRadius: BorderRadius.circular(12.0.h),
      ),
      child: ElevatedButton(
      onPressed: isEnabled ? wCtrl.onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 6.0.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.h)),
      ), 
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            ColorFiltered(
              colorFilter: ColorFilter.mode(fgColor, BlendMode.srcIn),
              child: icon, 
            ),
            SizedBox(width: 8.0.h),
          ],
          Text(label, style: TextStyle(fontSize: 12.0.h)),
        ],
      ),
    )));
  }
}

