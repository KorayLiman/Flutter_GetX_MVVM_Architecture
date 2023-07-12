import 'package:dio/dio.dart';

final class NetworkError {
  Object error;
  int? statusCode;
  DioException? dioException;
  NetworkError({required this.error, this.statusCode, this.dioException});
}
