import 'package:dio/dio.dart';

import '../../env/env.dart';
import '../../product/constants/app_constants.dart';
import '../../product/enum/build_type.dart';
import 'core_dio.dart';

final class NetworkManager {
  late final CoreDio coreDio;

  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ??= NetworkManager._();

  NetworkManager._() {
    coreDio = CoreDio(
      baseOptions: BaseOptions(
        baseUrl: AppConstants.appBuildType.buildType == BuildType.test ? Env.testBaseUrl : Env.liveBaseUrl,
      ),
    );
  }
}
