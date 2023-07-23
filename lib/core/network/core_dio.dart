import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_new_mvvm_architecture/core/base/model/base_model.dart';
import 'package:getx_new_mvvm_architecture/core/base/service/base_response.dart';
import 'package:getx_new_mvvm_architecture/product/enum/http_type.dart';
import 'package:getx_new_mvvm_architecture/product/enum/network_path.dart';
import 'package:getx_new_mvvm_architecture/product/extension/http_type_extension.dart';
import 'package:getx_new_mvvm_architecture/product/extension/network_path_extension.dart';
import 'package:getx_new_mvvm_architecture/product/model/network_error.dart';
import 'package:getx_new_mvvm_architecture/product/utility/loader_manager.dart';

import '../../product/mixin/network_logger_mixin.dart';

class CoreDio with NetworkLoggerMixin {
  CoreDio({required BaseOptions baseOptions}) {
    _baseOptions = baseOptions;
    _dio = Dio(_baseOptions);
  }
  late final BaseOptions _baseOptions;
  late final Dio _dio;
  final LoaderManager _loaderManager = LoaderManager.instance;

  Future<BaseResponse<T>> primitiveRequest<T extends Object>({
    required NetworkPath path,
    required HttpType type,
    BaseModel? data,
    FormData? dioFormData,
    BaseModel? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    Duration? connectionTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    bool showIndicator = false,
  }) async {
    try {
      if (showIndicator) _loaderManager.show();
      if (kDebugMode) logRequestInfo(requestUrl: "${_dio.options.baseUrl}${path.path}", type: type, data: data, pathSuffix: pathSuffix, headers: headers, queryParameters: queryParameters);
      _dio.options = _baseOptions.copyWith(connectTimeout: connectionTimeout, receiveTimeout: receiveTimeout, sendTimeout: sendTimeout);
      int requestStartTime = DateTime.now().millisecondsSinceEpoch;
      Response<T> response = await _dio.request<T>(
        pathSuffix == null ? path.path : "${path.path}/$pathSuffix",
        queryParameters: queryParameters?.toJson(),
        data: dioFormData ?? data?.toJson(),
        options: Options(
          method: type.type,
          headers: headers,
          contentType: contentType,
        ),
      );
      final responseTimeMilliseconds = DateTime.now().millisecondsSinceEpoch - requestStartTime;
      return _getPrimitiveSuccessResponse(response: response, requestUrl: "${_dio.options.baseUrl}${path.path}", responseTime: responseTimeMilliseconds);
    } catch (exception) {
      return _getPrimitiveErrorResponse(error: exception, requestUrl: "${_dio.options.baseUrl}${path.path}");
    } finally {
      _loaderManager.hide();
    }
  }

  Future<BaseResponse<T>> request<T, M extends BaseModel>({
    required NetworkPath path,
    required HttpType type,
    required M responseEntityModel,
    BaseModel? data,
    FormData? dioFormData,
    BaseModel? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    Duration? connectionTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    bool showIndicator = false,
  }) async {
    try {
      if (showIndicator) _loaderManager.show();
      if (kDebugMode) logRequestInfo(requestUrl: "${_dio.options.baseUrl}${path.path}", type: type, data: data, pathSuffix: pathSuffix, headers: headers, queryParameters: queryParameters);
      _dio.options = _baseOptions.copyWith(connectTimeout: connectionTimeout, receiveTimeout: receiveTimeout, sendTimeout: sendTimeout);
      int requestStartTime = DateTime.now().millisecondsSinceEpoch;
      Response response = await _dio.request(
        pathSuffix == null ? path.path : "${path.path}$pathSuffix",
        queryParameters: queryParameters?.toJson(),
        data: dioFormData ?? data?.toJson(),
        options: Options(
          method: type.type,
          headers: headers,
          contentType: contentType,
        ),
      );
      final responseTimeMilliseconds = DateTime.now().millisecondsSinceEpoch - requestStartTime;
      return _getSuccessResponse<T, M>(response: response, requestUrl: "${_dio.options.baseUrl}${path.path}", responseEntityModel: responseEntityModel, responseTime: responseTimeMilliseconds);
    } catch (exception) {
      return _getErrorResponse(error: exception, requestUrl: "${_dio.options.baseUrl}${path.path}");
    } finally {
      _loaderManager.hide();
    }
  }

  BaseResponse<T> _getPrimitiveSuccessResponse<T extends Object>({required Response<T> response, required String requestUrl, required int responseTime}) {
    if (kDebugMode) logResponseInfo(response: response, responseTime: responseTime, requestUrl: requestUrl);
    return BaseResponse<T>(data: response.data);
  }

  BaseResponse<T> _getSuccessResponse<T, M extends BaseModel>({required Response response, required String requestUrl, required M responseEntityModel, required int responseTime}) {
    if (kDebugMode) logResponseInfo(response: response, responseTime: responseTime, requestUrl: requestUrl);
    T? data = _getData(jsonResponse: response.data, responseEntityModel: responseEntityModel);
    return BaseResponse<T>(data: data);
  }

  BaseResponse<T> _getPrimitiveErrorResponse<T extends Object>({required Object error, required String requestUrl}) {
    int? statusCode = error is DioException ? error.response?.statusCode : null;
    DioException? dioException = error is DioException ? error : null;
    if (kDebugMode) logErrorResponseInfo(statusCode: statusCode, error: error, requestUrl: requestUrl);
    return BaseResponse<T>(networkError: NetworkError(error: error, statusCode: statusCode, dioException: dioException));
  }

  BaseResponse<T> _getErrorResponse<T>({required Object error, required String requestUrl}) {
    int? statusCode = error is DioException ? error.response?.statusCode : null;
    DioException? dioException = error is DioException ? error : null;
    if (kDebugMode) logErrorResponseInfo(statusCode: statusCode, error: error, requestUrl: requestUrl);
    return BaseResponse<T>(networkError: NetworkError(error: error, statusCode: statusCode, dioException: dioException));
  }

  T? _getData<T, M extends BaseModel>({required dynamic jsonResponse, required M responseEntityModel}) {
    if (jsonResponse is List) {
      return jsonResponse.map((e) => responseEntityModel.fromJson(e)).toList().cast<M>() as T;
    } else if (jsonResponse is Map<String, dynamic>) {
      return responseEntityModel.fromJson(jsonResponse) as T;
    } else {
      return null;
    }
  }
}
