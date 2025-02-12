// Widget pels camps d'introducció de cadenes de caràcters o números.
// CreatedAt: 2024/10/26 ds. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

class LdTextField extends LdWidget {
  // MEMBRES --------------------------
  final TextEditingController txtCtrl;
  String? imgKey;
  dynamic imgId;
  Image?  img;
  final String? hintText;
  final bool obscureText;
  
  // MEMBRES AUXILIARS ----------------
  bool _focus = false;

  LdTextField({
    super.key,
    String? pId,
    this.imgKey,
    this.imgId,
    String  pLabel = '',
    dynamic pText,
    int?    pErrorCode,
    String? pErrorMessage,
    bool pIsEnabled = true, 
    bool pIsMandatory = false, 
    bool pIsVisible = true,
    bool pIsPrimary = true,
    this.hintText, 
    this.obscureText = false, 
    FocusNode? pFocusNode,
    VoidCallback? pOnPressed,
    required LdViewController pVCtrl,
  }): txtCtrl = (pText == null)
    ? TextEditingController()
    : (pText is TextEditingController)? pText: TextEditingController(text: pText.toString()),
    super(pWCtrl: LdWidgetController(
    pId: pId, pLabel: pLabel,
    pErrorCode: pErrorCode, pErrorMessage: pErrorMessage,
    pIsEnabled: pIsEnabled, pIsMandatory: pIsMandatory, 
    pIsVisible: pIsVisible, pIsPrimary: pIsPrimary,
    pVCtrl: pVCtrl, pOnPressed: pOnPressed,
    )) {
    wCtrl.focusNode.addListener(() {
      SchedulerBinding.instance.addPostFrameCallback((_) { // ⚠️ Evita crides innecessàries
        Debug.debug(1, "FocusNode.listener: before[${xCtrl.id}] = ${focusNode.hasFocus}");
        _focus = !_focus;
        wCtrl.update([{xCtrl.id}]); 
        Debug.debug(1, "FocusNode.listener: after[${xCtrl.id}] = ${focusNode.hasFocus}");
      });
    });
  }
 

  Widget _buildEditField(BuildContext pCxt, Image? pImage) {
    LdImageController inst = LdImageController.inst;
    ThemeData theme = Theme.of(pCxt);
    // Color borderColor = theme.inputDecorationTheme.border?.borderSide.color ?? getBorderColor(pCxt);
    InputDecorationTheme inputTheme = theme.inputDecorationTheme;

    return TextField(
        focusNode: focusNode,
        controller: txtCtrl,
        obscureText: obscureText,
        style: txsEditStyle(pCxt),
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIconColor: hasFocus
              ? Colors.green.shade700 // inputTheme.border!.borderSide.color
              : isEnabled
                ? Colors.orange.shade700
                : Colors.yellow.shade500,// theme.textTheme.bodyMedium!.color,
          labelStyle: inputTheme.labelStyle!.copyWith(
            backgroundColor: Colors.white,
            color:
            hasFocus
              ? inputTheme.border!.borderSide.color
              : isEnabled
                ? inputTheme.labelStyle!.color
                : theme.textTheme.bodyMedium!.color,
          ),
          prefixIcon: (imgKey != null && inst.exists(imgKey!))
            ? inst.getFilteredImage(
                pKey: imgKey, 
                pIsEnabled: isEnabled, 
                pHasFocus: hasFocus,
                pColor: isEnabled
                  ? hasFocus
                    ? inputTheme.border!.borderSide.color
                    : theme.textTheme.bodyMedium!.color
                  : theme.disabledColor
              )
            : null,
        ),
      );
  }

  @override
  Widget buildContent(BuildContext context) {
    // String tname = "${runtimeType.toString()}_${runtimeType.toString()}";
    // Debug.debug(1, "LdTextField.buildContent: ${xCtrl.id}");
    // Debug.debug(1, "ctrl enregistrat?[${xCtrl.id}, '$tname']: ${xCtrl.id}");
    // Debug.debug(1, "ctrl enregistrat?[${xCtrl.id}, '$tname']: ${Get.isRegistered(tag: tname)}");
    LdImageController inst = LdImageController.inst;
    return GetBuilder<LdViewController>(
      id: {xCtrl.id},
      tag: wCtrl.runtimeType.toString(),
      builder: (controller) => 
        GetBuilder<LdImageController>(
          id: {xCtrl.id},
          init: LdImageController.inst,
          builder: (controller) {
            if (imgKey == null) {
              return _buildEditField(context, null);
            }

            Image? img = inst.getStoredImage(imgKey!);
            if (img == null && imgKey != null && imgKey!.isNotEmpty) {
              inst.loadImageFromRef(
                imgKey!,
                pTgts:   [xCtrl.id],
                pRef:    imgId,
                pWidth:  defIconWidth,
                pHeight: defIconHeight,
              );

              return _buildEditField(context, null);
            }

            return _buildEditField(context, img);
          },
        )
      );
  }
}
