import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/product/extension/navigation_constants_extension.dart';

enum NavigationConstants {
  splash,
  home,
}

List<GetPage> get getPages => NavigationConstants.values.map((e) => GetPage(name: e.pageName, page: () => e.pageWidget)).toList();
