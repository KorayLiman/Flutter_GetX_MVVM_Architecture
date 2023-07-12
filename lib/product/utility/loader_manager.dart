import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class LoaderManager {
  static LoaderManager? _instance;
  static LoaderManager get instance => _instance ??= LoaderManager._();
  LoaderManager._();

  void show({
    bool barrierDismissible = false,
    Widget? indicator,
  }) {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        Center(child: indicator ?? const CircularProgressIndicator()),
        barrierDismissible: barrierDismissible,
      );
    }
  }

  void hide() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
