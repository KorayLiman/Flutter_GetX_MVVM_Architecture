import 'package:getx_new_mvvm_architecture/product/enum/http_type.dart';
import 'package:getx_new_mvvm_architecture/product/enum/network_path.dart';

import '../../../../core/base/service/base_response.dart';
import '../../../../core/base/service/base_service.dart';
import '../../../../core/network/network_manager.dart';
import '../model/product_model.dart';

class HomeService extends BaseService {
  static HomeService? _instance;
  static HomeService get instance => _instance ??= HomeService._init();
  HomeService._init() : super(NetworkManager.instance);

  Future<BaseResponse<ProductModel>> getProduct() async {
    final response = await request<ProductModel, ProductModel>(path: NetworkPath.products, type: HttpType.get, responseEntityModel: ProductModel(), pathSuffix: "/1");
    return response;
  }
}
