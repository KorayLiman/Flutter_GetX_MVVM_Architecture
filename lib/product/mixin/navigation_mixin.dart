import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/extension/navigation_constants_extension.dart';

import '../constants/navigation_constants.dart';

mixin class NavigationMixin {
  Future<T?>? toWidget<T>(Widget page, {dynamic argument, bool preventDuplicates = true, Transition? transition, Duration? transitionDuration}) async =>
      await Get.to<T>(() => page, arguments: argument, preventDuplicates: true, transition: transition, duration: transitionDuration);

  Future<T?>? toNamed<T>(NavigationConstants page, {dynamic argument, bool preventDuplicates = true}) async =>
      await Get.toNamed<T>(page.pageName, arguments: argument, preventDuplicates: preventDuplicates);
  Future<T?>? offNamed<T>(NavigationConstants page, {dynamic argument}) async => await Get.offNamed<T>(page.pageName, arguments: argument);
  Future<T?>? offAllNamed<T>(NavigationConstants page, {dynamic argument}) async => await Get.offAllNamed<T>(page.pageName, arguments: argument);

  Future<T?>? offNamedUntil<T>(NavigationConstants page, NavigationConstants untilPage, {dynamic argument}) async =>
      await Get.offNamedUntil<T>(page.pageName, ModalRoute.withName(untilPage.pageName), arguments: argument);

  void back<T>({T? result, bool closeOverlays = false, bool canPop = true}) => Get.back<T>(result: result, closeOverlays: closeOverlays, canPop: canPop);

  void until(NavigationConstants untilPage) => Get.until(ModalRoute.withName(untilPage.pageName));
}
