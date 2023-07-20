import 'package:flutter/foundation.dart';

mixin class DebugPrinterMixin {
  void printDebug(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
