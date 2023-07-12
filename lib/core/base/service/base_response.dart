import '../../../product/model/network_error.dart';

class BaseResponse<T> {
  final T? data;
  final NetworkError? networkError;

  BaseResponse({this.data, this.networkError});
}
