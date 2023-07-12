import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/local_storage/local_storage.dart';
import 'package:getx_new_mvvm_architecture/objectbox.g.dart';
import 'package:getx_new_mvvm_architecture/product/constants/app_constants.dart';
import 'package:getx_new_mvvm_architecture/product/constants/navigation_constants.dart';
import 'package:getx_new_mvvm_architecture/product/extension/navigation_constants_extension.dart';
import 'package:lehttp_overrides/lehttp_overrides.dart';

void main() {
  _runApplication();
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await _handleAndroidApiVersionConditions();
  await _openDb();
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
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}

Future<void> _openDb() async {
  try {
    final store = await openStore();
    Get.put<LocalStorage>(LocalStorage(store: store));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void _runApplication() {
  runZonedGuarded(
    () async {
      await _init();
      runApp(_myApp);
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

Widget get _myApp => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppConstants.appTheme.theme,
      getPages: getPages,
      initialRoute: NavigationConstants.splash.pageName,
    );
