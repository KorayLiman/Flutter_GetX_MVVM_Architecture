import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:getx_new_mvvm_architecture/core/base/model/base_model.dart';
import 'package:getx_new_mvvm_architecture/core/base/service/base_response.dart';
import 'package:getx_new_mvvm_architecture/core/network/network_manager.dart';
import 'package:getx_new_mvvm_architecture/product/enum/http_type.dart';
import 'package:getx_new_mvvm_architecture/product/enum/network_path.dart';

abstract base class BaseService {
  BaseService(this._networkManager);
  late final NetworkManager _networkManager;

  Future<BaseResponse<T>> request<T, M extends BaseModel>(
      {required NetworkPath path,
      required HttpType type,
      required M responseEntityModel,
      BaseModel? data,
      FormData? dioFormData,
      BaseModel? queryParameters,
      String? pathSuffix,
      String? contentType,
      Duration connectTimeout = const Duration(milliseconds: 15000), // 15 sec
      Duration receiveTimeout = const Duration(milliseconds: 15000), // 15 sec
      Duration sendTimeout = const Duration(milliseconds: 15000), // 15 sec
      bool showResponseErrorSnackbar = true,
      bool showIndicator = false}) async {
    final response = await _networkManager.coreDio.request<T, M>(
      path: path,
      type: type,
      responseEntityModel: responseEntityModel,
      data: data,
      dioFormData: dioFormData,
      queryParameters: queryParameters,
      pathSuffix: pathSuffix,
      contentType: contentType,
      connectionTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      showIndicator: showIndicator,
      headers: _generateHeaders(path: path),
    );
    if (showResponseErrorSnackbar) _showResponseErrorSnackbar(baseResponse: response);
    return response;
  }

  Future<BaseResponse<T>> primitiveRequest<T extends Object>(
      {required NetworkPath path,
      required HttpType type,
      BaseModel? data,
      FormData? dioFormData,
      BaseModel? queryParameters,
      String? pathSuffix,
      String? contentType,
      Duration connectTimeout = const Duration(milliseconds: 15000), // 15 sec
      Duration receiveTimeout = const Duration(milliseconds: 15000), // 15 sec
      Duration sendTimeout = const Duration(milliseconds: 15000), // 15 sec
      bool showResponseErrorSnackbar = true,
      bool showIndicator = false}) async {
    final response = await _networkManager.coreDio.primitiveRequest<T>(
      path: path,
      type: type,
      data: data,
      dioFormData: dioFormData,
      queryParameters: queryParameters,
      pathSuffix: pathSuffix,
      contentType: contentType,
      connectionTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      showIndicator: showIndicator,
      headers: _generateHeaders(path: path),
    );
    if (showResponseErrorSnackbar) _showResponseErrorSnackbar(baseResponse: response);
    return response;
  }

  void _showResponseErrorSnackbar({required BaseResponse baseResponse}) {
    if (baseResponse.networkError != null) {
      Get.snackbar("RequestError", baseResponse.networkError?.error.toString() ?? "Unknown Error");
    }
  }

  Map<String, dynamic> _generateHeaders({required NetworkPath path}) {
    // Generate header here i.e Bearer Token
    return {};
  }
}
