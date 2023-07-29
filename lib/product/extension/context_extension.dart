import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isKeyboardOn => FocusManager.instance.primaryFocus?.hasFocus == true;
  void turnOffKeyboard() {
    if (isKeyboardOn) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
