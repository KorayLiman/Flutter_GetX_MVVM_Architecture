import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';

final class LoaderManager {
  static LoaderManager? _instance;
  static LoaderManager get instance => _instance ??= LoaderManager._();
  LoaderManager._();

  GetDialogRoute? route;

  void show({
    bool barrierDismissible = false,
    Widget? indicator,
  }) {
    if (route == null) {
      route = GetDialogRoute(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          barrierDismissible: barrierDismissible);
      navigator?.push(route!);
    }
  }

  void hide() {
    if (route?.canPop == true) {
      Get.removeRoute(route!);
      route = null;
    }
  }
}
