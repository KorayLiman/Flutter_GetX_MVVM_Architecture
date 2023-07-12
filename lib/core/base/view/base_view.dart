import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/enum/page_state.dart';
import 'package:getx_new_mvvm_architecture/product/extension/context_extension.dart';

import '../viewmodel/base_viewmodel.dart';

typedef WidgetCallback = Widget Function();

class BaseView extends StatelessWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onSuccess,
    this.onLoading,
    this.onEmpty,
    this.onError,
    this.onOffline,
  }) : super(key: key);

  final BaseViewModel viewModel;
  final WidgetCallback onSuccess;
  final WidgetCallback? onLoading;
  final WidgetCallback? onEmpty;
  final WidgetCallback? onError;
  final WidgetCallback? onOffline;

  @override
  Widget build(BuildContext context) => _buildView(context: context);

  Widget _buildView({required BuildContext context}) {
    return GestureDetector(
      onTap: context.turnOffKeyboard,
      child: Obx(
        () => switch (viewModel.pageState) {
          PageState.success => onSuccess(),
          PageState.loading => onLoading != null ? onLoading!() : _defaultLoadingScreen,
          PageState.empty => onEmpty != null ? onEmpty!() : _defaultEmptyScreen,
          PageState.error => onError != null ? onError!() : _defaultErrorScreen,
          PageState.offline => onOffline != null ? onOffline!() : _defaultOfflineScreen,
        },
      ),
    );
  }

  Widget get _defaultLoadingScreen => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  Widget get _defaultEmptyScreen => const Scaffold(
        body: Center(
          child: Text("Empty Screen"),
        ),
      );
  Widget get _defaultErrorScreen => const Scaffold(
        body: Center(
          child: Text("Error Screen"),
        ),
      );
  Widget get _defaultOfflineScreen => const Scaffold(
        body: Center(
          child: Text("Offline Screen"),
        ),
      );
}
