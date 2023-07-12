import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_new_mvvm_architecture/core/base/model/base_model.dart';
import 'package:getx_new_mvvm_architecture/product/utility/logger.dart';

import '../enum/http_type.dart';

mixin class NetworkLoggerMixin {
  void logRequestInfo({
    required String requestUrl,
    required HttpType type,
    BaseModel? data,
    FormData? dioFormData,
    BaseModel? queryParameters,
    String? pathSuffix,
    Map<String, dynamic>? headers,
  }) {
    String requestLog = """
        REQUEST ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
        DateTime: ${DateTime.now()}
        Method: ${type.name}
        Request Url: $requestUrl,
        Query Parameters: ${jsonEncode(queryParameters?.toJson())}
        Request Data: ${jsonEncode(data?.toJson())}
        Request DioFormData: ${dioFormData?.fields} ${dioFormData?.files}
        Path Suffix: $pathSuffix
        Headers: $headers
        ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
      """;
    Logger.logMsg(msg: requestLog, color: LogColors.white);
  }

  void logResponseInfo({
    required Response response,
    required String requestUrl,
  }) {
    String responseLog = """
        RESPONSE <-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-
        DateTime: ${DateTime.now()}
        Request Url: $requestUrl
        Headers: ${response.requestOptions.headers.toString()}
        Response Status Code: ${response.statusCode.toString()}
        Response Status Message: ${(response.statusMessage ?? "null")}
        Response Data: ${response.data.toString()}
        <-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-<-
      """;
    Logger.logMsg(msg: responseLog, color: LogColors.green);
  }

  void logErrorResponseInfo({required int? statusCode, required Object error, required String requestUrl}) {
    String errorResponseLog = """
        REQUEST ERROR XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        Status Code: $statusCode
        Request Url: $requestUrl
        Error String: ${error.toString()}
        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        """;
    Logger.logMsg(msg: errorResponseLog, color: LogColors.red);
  }
}
