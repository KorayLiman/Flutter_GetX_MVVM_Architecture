import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/constants/app_constants.dart';
import 'package:getx_new_mvvm_architecture/product/constants/navigation_constants.dart';
import 'package:getx_new_mvvm_architecture/product/extension/navigation_constants_extension.dart';

void main() {
  _runApplication();
}

void _init() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

void _runApplication() {
  runZonedGuarded(
    () {
      _init();
      runApp(const MyApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppConstants.appTheme.theme,
      getPages: getPages,
      initialRoute: NavigationConstants.splash.pageName,
    );
  }
}
