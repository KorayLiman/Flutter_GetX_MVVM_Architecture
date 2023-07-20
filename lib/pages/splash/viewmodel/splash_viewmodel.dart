import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:getx_new_mvvm_architecture/product/constants/navigation_constants.dart';
import 'package:lehttp_overrides/lehttp_overrides.dart';

import '../../../core/local_storage/local_storage.dart';
import '../../../objectbox.g.dart';

final class SplashViewModel extends BaseViewModel {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await _initFirebase();
    await _handleAndroidApiVersionConditions();
    await _openDb();
    _navigateToHome();
    super.onReady();
  }

  Future<void> _initFirebase() async {
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<void> _handleAndroidApiVersionConditions() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 25) {
        HttpOverrides.global = LEHttpOverrides();
      }
      if (androidInfo.version.sdkInt == 23) {
        const channel = MethodChannel("objectbox");
        try {
          await channel.invokeMethod("loadNativeObjectboxLibrary");
        } catch (e) {
          printDebug(e);
        }
      }
    }
  }

  Future<void> _openDb() async {
    try {
      final store = await openStore();
      Get.put<LocalStorage>(LocalStorage(store: store));
    } catch (e) {
      printDebug(e);
    }
  }

  Future<void> _navigateToHome() async {
    await 1.seconds.delay(
      () async {
        await offNamed(NavigationConstants.home);
      },
    );
  }
}
