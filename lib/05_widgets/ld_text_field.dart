// Widget pels camps d'introducció de cadenes de caràcters o números.
// CreatedAt: 2024/10/26 ds. JIQ

// ignore_for_file: must_be_immutable, avoid_renaming_method_parameters, avoid_init_to_null, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:ld_wbench/05_widgets/index.dart';


class LdTextField extends LdWidget {
  final bool isObscure;
  final IconData? prefixIcon;
  final TextEditingController? tCtrl;

  LdTextField({
    super.key,
    required super.id,
    required super.pLabel,
    required String? pText,
    super.errorMessage,
    super.isEnabled,
    super.focusNode,
    this.isObscure = false,
    this.prefixIcon,
  }): tCtrl = TextEditingController(text: pText?? "");

  @override
  Widget buildContent(BuildContext context) {
    return TextFormField(
      controller: tCtrl,
      focusNode: focusNode,
      obscureText: isObscure,
      enabled: isEnabled,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: getBorderColor(context))
            : null,
        filled: true,
        fillColor: isEnabled ? Colors.white : Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: getBorderColor(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: getBorderColor(context), width: 2),
        ),
      ),
    );
  }
  
  // IMPLEMENTACIÓ DE 'LdWidget' ------
  @override
  void dispose() {
    // No cal alliberar recursos de forma explícita.
  }
}