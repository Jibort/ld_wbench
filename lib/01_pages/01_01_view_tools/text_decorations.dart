// Decoració de camps de text.
// createdAt: 24/10/22 dt. JIQ

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/text_styles.dart';

InputDecoration textFieldDecoration({required BuildContext pCxt, String? pHint, String? pPrefix, Icon? pPrefixIcon}) {
  return InputDecoration( 
    alignLabelWithHint: true,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.w)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.w)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2.w)),
    filled: true,
    hintText: pHint,
    isDense: false,
    // : txsTextField(),
    floatingLabelStyle: txsFloatingLabel(pCxt: pCxt),
    prefixText: pPrefix,
    prefixIcon: pPrefixIcon,
  );
}

InputDecoration fieldDecoration({required BuildContext pCxt, String? pLabel, String? pHint, String? pPrefix, Icon? pPrefixIcon}) {
  return InputDecoration( 
    contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.w)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2.w)),
    filled: true,
    hintText: pHint,
    isDense: false,
    labelText: pLabel,
    labelStyle: txsTextField(pCxt: pCxt),
    floatingLabelStyle: txsFloatingLabel(pCxt: pCxt),
    prefixText: pPrefix,
    prefixIcon: pPrefixIcon,

  );
}

InputDecoration comboDecoration({required BuildContext pCxt, String? pLabel, String? pHint, String? pPrefix, Icon? pPrefixIcon}) {
  return InputDecoration( 
    contentPadding: EdgeInsets.only(left: 10.w, right: 5.w),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.w)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2.w)),
    filled: true,
    hintText: pHint,
    isDense: false,
    labelText: pLabel,
    labelStyle: txsTextField(pCxt: pCxt),
    floatingLabelStyle: txsFloatingLabel(pCxt: pCxt),
    prefixText: pPrefix,
    prefixIcon: pPrefixIcon,
    
  );
}

InputDecoration comboItemDecoration({required BuildContext pCxt}) {
  return InputDecoration( 
    contentPadding: EdgeInsets.only(left: 10.w, right: 5.w),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.w)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2.w)),
    filled: true,
    isDense: false,
  );
}