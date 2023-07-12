import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/base/view/base_view.dart';
import 'package:getx_new_mvvm_architecture/core/base/widget/base_stateless_widget.dart';

import '../viewmodel/home_viewmodel.dart';

final class Home extends BaseStatelessWidget<HomeViewModel> {
  Home({Key? key}) : super(key: key, viewModel: HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      onSuccess: () => _onSuccess(context: context),
    );
  }

  Widget _onSuccess({required BuildContext context}) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _floatingActionButton,
      bottomNavigationBar: _navigationBar,
      body: _body,
    );
  }

  AppBar get _appBar {
    return AppBar(
      centerTitle: false,
      title: const Text("Home"),
    );
  }

  Widget get _body {
    return Obx(() => [
          const Center(
            child: Text("Tab 1"),
          ),
          const Center(
            child: Text("Tab 2"),
          ),
          const Center(
            child: Text("Tab 3"),
          ),
        ][viewModel.navigationIndex.value]);
  }

  NavigationBar get _navigationBar {
    return NavigationBar(
      selectedIndex: viewModel.navigationIndex.value,
      onDestinationSelected: viewModel.onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.list_alt_outlined), label: "Tab 1"),
        NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: "Tab 2"),
        NavigationDestination(icon: Icon(Icons.person_outline), label: "Tab 3"),
      ],
    );
  }

  FloatingActionButton get _floatingActionButton {
    return FloatingActionButton.extended(
      onPressed: viewModel.onFloatingActionButtonPressed,
      label: const Text("Dialog"),
      icon: const Icon(Icons.question_answer_outlined),
    );
  }
}
