// Widget pels camps d'introducció de cadenes de caràcters o números.
// CreatedAt: 2024/10/26 ds. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

class LdTextField extends LdWidget {
  final TextEditingController controller;
  final String hintText;
  final String? imageKey; // Imatge a la part esquerra
  final bool obscureText;

  LdTextField({
    super.key,
    super.pLabel,
    required super.id, 
    dynamic pText,
    this.hintText = '',
    this.imageKey,
    this.obscureText = false,
  }): controller = (pText == null)
    ? TextEditingController()
    : (pText is TextEditingController)? pText: TextEditingController(text: pText.toString());

  @override
Widget buildContent(BuildContext context) {

  // bool isEnabled = true;       // Determina si el widget pot set ocupat pel focus.
  // bool isMandatory = false;    // Determina si el widget és de compliment obligatori.
  // bool isVisible = true;       // Determina si el widget és visible.
  
  final theme = Theme.of(context);
  final bgColor = !isEnabled ? theme.colorScheme.surface.withValues(alpha: 0.5) :
                  errorMessage == null ? theme.colorScheme.primary :
                  theme.colorScheme.secondary;
    final fgColor = !isEnabled ? Colors.grey :
                        errorMessage == null ? theme.colorScheme.onPrimary :
                        theme.colorScheme.onSecondary;

  return GetBuilder(      
    id: id,
    builder: (pCxt) => 
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: (imageKey != null)
            ? LdImageController.instance.getStoredImage(imageKey!)
            : null,
          hintText: hintText,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: bgColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: getBorderColor(context)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: getBorderColor(context)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: getBorderColor(context), width: 2.0.h),
          ),
        ),
      ),
  );
}

  @override
  void dispose() {
    // Aquest widget no necessita alliberar recursos explícitament.
  }
}
