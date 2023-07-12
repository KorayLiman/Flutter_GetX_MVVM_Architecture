import 'package:get/get.dart';
import 'package:getx_new_mvvm_architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:getx_new_mvvm_architecture/product/constants/navigation_constants.dart';

final class SplashViewModel extends BaseViewModel {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    _navigateToHome();
    super.onReady();
  }

  Future<void> _navigateToHome() async {
    await 1.seconds.delay(
      () async {
        await offNamed(NavigationConstants.home);
      },
    );
  }
}
