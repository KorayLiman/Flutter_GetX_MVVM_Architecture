import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin class GetXMixin {
  BuildContext? get context => Get.context;
  BuildContext? get overlayContext => Get.overlayContext;
  String get currentRoute => Get.currentRoute;
  String get previousRoute => Get.previousRoute;
  dynamic get arguments => Get.arguments;
}
