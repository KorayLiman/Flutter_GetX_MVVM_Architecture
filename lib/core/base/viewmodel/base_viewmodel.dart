import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/enum/page_state.dart';
import 'package:getx_new_mvvm_architecture/product/mixin/debug_printer_mixin.dart';
import 'package:getx_new_mvvm_architecture/product/mixin/navigation_mixin.dart';
import 'package:getx_new_mvvm_architecture/product/utility/loader_manager.dart';

import '../../../product/mixin/getx_mixin.dart';
import '../../local_storage/local_storage.dart';

abstract base class BaseViewModel extends GetxController with NavigationMixin, DebugPrinterMixin, GetXMixin {
  final LoaderManager loaderManager = LoaderManager.instance;
  LocalStorage get localStorage => LocalStorage.to;
  final _pageState = PageState.success.obs;
  PageState get pageState => _pageState.value;
  void setPageState(PageState newPageState) => _pageState.value = newPageState;
  void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
