import 'package:flutter/foundation.dart';

mixin class DebugPrinterMixin {
  void debugPrint(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
