import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/base/viewmodel/base_viewmodel.dart';

abstract base class BaseStatelessWidget<T extends BaseViewModel> extends StatelessWidget {
  late final T viewModel;

  BaseStatelessWidget({Key? key, required T viewModel}) : super(key: key) {
    this.viewModel = Get.put<T>(viewModel);
  }
}
