import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:getx_new_mvvm_architecture/pages/general/home/service/home_service.dart';
import 'package:getx_new_mvvm_architecture/pages/general/home/widgets/home_dialog/view/home_dialog_view.dart';
import 'package:getx_new_mvvm_architecture/product/enum/page_state.dart';

import '../../../../product/constants/app_constants.dart';
import '../../../../product/model/local_storage_models.dart';

final class HomeViewModel extends BaseViewModel {
  @override
  void onInit() {
    setPageState(PageState.loading);
    super.onInit();
  }

  @override
  void onReady() async {
    _putUserEntityToDb();
    final response = await _homeService.getProduct();
    setPageState(PageState.success);
    super.onReady();
  }

  final navigationIndex = 0.obs;
  final HomeService _homeService = HomeService.instance;

  void _putUserEntityToDb() {
    int entityId = localStorage.putEntity(
      entity: AppUser(id: "123", name: "Koray", surname: "Liman"),
    );
    debugPrint("entityId: $entityId");
    AppUser? appUser = localStorage.getAppUser(entityId: AppConstants.appUserEntityId.appUserEntityId);
    debugPrint("${appUser?.name} ${appUser?.surname} id:${appUser?.id}");
  }

  void onDestinationSelected(int selectedDestinationIndex) {
    navigationIndex.value = selectedDestinationIndex;
  }

  Future<void> onFloatingActionButtonPressed() async {
    if (context != null) {
      await showDialog(
        context: context!,
        builder: (context) => HomeDialog(),
      );
    }
  }
}
