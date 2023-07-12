import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/enum/page_state.dart';
import 'package:getx_new_mvvm_architecture/product/mixin/debug_printer_mixin.dart';
import 'package:getx_new_mvvm_architecture/product/mixin/navigation_mixin.dart';
import 'package:getx_new_mvvm_architecture/product/utility/loader_manager.dart';

import '../../local_storage/local_storage.dart';

abstract base class BaseViewModel extends GetxController with NavigationMixin, DebugPrinterMixin {
  final LoaderManager loaderManager = LoaderManager.instance;
  final LocalStorage localStorage = LocalStorage.to;
  final _pageState = PageState.success.obs;
  PageState get pageState => _pageState.value;
  void setPageState(PageState newPageState) => _pageState.value = newPageState;
  BuildContext? get context => Get.context;
  BuildContext? get overlayContext => Get.overlayContext;
  dynamic get arguments => Get.arguments;
}
