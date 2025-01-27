// Eines de debug.
// @createdAt: 2024-06-21 dv: JIQ

import 'package:flutter/foundation.dart';

import 'null_mang.dart';

const levelInfo = -1;
const levelWarn = -2;

class Debug {
  static void debug(int? pLevel, String pMsg) {
    if (kDebugMode) {
      if (isNull(pLevel)) {
        pLevel == 0;
      }
      print("DEBG[$pLevel]: $pMsg");
    }
  }

  static void info(String pMsg) {
    if (kDebugMode) {
      print("INFO: $pMsg");
    }
  }

  static void warn(String pMsg) {
    if (kDebugMode) {
      print("WARN: $pMsg");
    }
  }

  static void error(String pMsg, Exception? pExc) {
    if (kDebugMode) {
      print("ERROR: $pMsg");
      if (isNotNull(pExc)) {
        print("EXCEPTION: ${pExc.toString()}");
      }
    }
  }

  static void fatal(String pMsg, Exception? pExc) {
    Map<String, String> parms = {
      'msg': pMsg,
      'exc': pExc?.toString() ?? "",
    };
    Error.throwWithStackTrace(parms["msg"]?? "Error!", StackTrace.fromString(""));
    // Get.offAndToNamed(rtFatalPage, arguments: [pMsg, pExc], parameters: parms);
  }

  static void itry(int? pLevel, String pMsg, {Exception? pExc}) async {
    if (isNull(pLevel)) {
      Debug.error(pMsg, pExc);
    } else if (pLevel == levelInfo) {
      Debug.info(pMsg);
    } else if (pLevel == levelWarn) {
      Debug.warn(pMsg);
    }
  }

  static Future<T?> ftry<T>(int? pLevel, String pMsg, {Exception? pExc}) async {
    if (isNull(pLevel)) {
      Debug.error(pMsg, pExc);
    } else if (pLevel == levelInfo) {
      Debug.info(pMsg);
    } else if (pLevel == levelWarn) {
      Debug.warn(pMsg);
    }

    return null;
  }
}
