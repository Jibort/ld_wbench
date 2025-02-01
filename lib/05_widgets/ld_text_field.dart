// Widget pels camps d'introducció de cadenes de caràcters o números.
// CreatedAt: 2024/10/26 ds. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

class LdTextField extends LdWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? imageKey; // Imatge a la part esquerra
  final String? asset; // 🔥 Ara podem passar una imatge (LdImage)
  final IconData? iconData; // 🔥 O una icona (IconData)
  

  LdTextField({
    super.key,
    super.pLabel,
    required super.id, 
    required super.bCxt,
    dynamic pText,
    this.hintText = '',
    this.imageKey,
    this.asset,
    this.iconData,
    this.obscureText = false,
  }): controller = (pText == null)
    ? TextEditingController()
    : (pText is TextEditingController)? pText: TextEditingController(text: pText.toString()) {
    focusNode.addListener(() {
      bCxt.notify(pTargets: [id]);  
    });
  }

Widget _buildEditField(BuildContext context, Image? icon) {
  LdImageController inst = LdImageController.instance;
  return Container(
    padding: EdgeInsets.only(left: 5.0.h, right: 5.0.h, top: 15.0.h),
    child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        style: txsEditStyle(context),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(left: 10.0.h, right: 5.0.h, top: 10.0.h, bottom: 10.0.h),
          labelText: label,
          labelStyle: txsLabelStyle(pIsFocused: isFocused, pIsEnabled: isEnabled, pIsError: errorMessage != null, pCxt: context),
          prefixIcon: (inst.exists(imageKey))
            ? inst.getFilteredImage(pKey: imageKey, pIsEnabled: isEnabled, pIsFocused: isFocused)
            : null,
          hintText: hintText,
           border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: getBorderColor(context)),
          ),
        ),
      ),
  );
}

  @override
  Widget buildContent(BuildContext context) {
  LdImageController inst = LdImageController.instance;
    return GetBuilder<ViewController>(
        id: id,
        builder: (controller) {
          if (imageKey == null) {
            return _buildEditField(context, null);
          }

          Image? img = inst.getStoredImage(imageKey!);
          if (img == null) {
            inst.loadImage(
              imageKey!,
              pTgts: [id],
              pAsset: asset,
              pIcon: iconData,
              pWidth: defIconWidth,
              pHeight: defIconHeight,
            );

            return _buildEditField(context, null);
          }

          return _buildEditField(context, img);
        },
      );
  }

  @override
  void dispose() {
    // Aquest widget no necessita alliberar recursos explícitament.
  }
}
