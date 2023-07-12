import 'package:getx_new_mvvm_architecture/product/constants/app_constants.dart';
import 'package:objectbox/objectbox.dart';

sealed class BaseLocalStorageModel {}

@Entity()
class AppUser extends BaseLocalStorageModel {
  @Id(assignable: true)
  int entityId = AppConstants.appUserEntityId.appUserEntityId;
  String? id;
  String? name;
  String? surname;

  AppUser({this.id, this.name, this.surname});
}
