import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtension on BuildContext {
  double get keyboardHeight => mediaQueryViewInsets.bottom;
  bool get isKeyboardOn => keyboardHeight != 0;
  void turnOffKeyboard() {
    if (isKeyboardOn) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
