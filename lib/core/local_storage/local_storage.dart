import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/mixin/debug_printer_mixin.dart';
import 'package:objectbox/objectbox.dart';

import '../../product/model/local_storage_models.dart';

class LocalStorage extends GetxService with DebugPrinterMixin {
  late final Box<AppUser> _appUserBox;

  LocalStorage({required Store store}) {
    _appUserBox = store.box<AppUser>();
  }
  static LocalStorage get to => Get.find<LocalStorage>();

  /// Puts given entity and returns it's id
  int putEntity({required BaseLocalStorageModel entity}) {
    try {
      return switch (entity) {
        AppUser appUser => _appUserBox.put(appUser),
      };
    } catch (e) {
      debugPrint(e);
      return -1;
    }
  }

  /// Deletes given entity returns true/false depending on the success of the operation
  bool deleteEntity({required BaseLocalStorageModel entity}) {
    try {
      return switch (entity) {
        AppUser appUser => _appUserBox.remove(appUser.entityId),
      };
    } catch (e) {
      debugPrint(e);
      return false;
    }
  }
  /// Returns AppUser? object with given entityId
  AppUser? getAppUser({required int entityId}) {
    return _appUserBox.get(entityId);
  }
}
