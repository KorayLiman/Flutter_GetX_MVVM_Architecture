import 'package:getx_new_mvvm_architecture/product/enum/http_type.dart';

extension HttpTypeExtension on HttpType {
  String get type => switch (this) {
        HttpType.get => "GET",
        HttpType.post => "POST",
        HttpType.put => "PUT",
        HttpType.delete => "DELETE",
      };
}
