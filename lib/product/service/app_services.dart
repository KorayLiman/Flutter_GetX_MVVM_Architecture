import 'package:getx_new_mvvm_architecture/product/enum/http_type.dart';
import 'package:getx_new_mvvm_architecture/product/enum/network_path.dart';

import '../../../../core/base/service/base_response.dart';
import '../../../../core/base/service/base_service.dart';
import '../../../../core/network/network_manager.dart';
import '../../pages/general/home/model/product_model.dart';

abstract base class AppServices {
  static final homeService = _HomeService.instance;
}

final class _HomeService extends BaseService {
  static _HomeService? _instance;
  static _HomeService get instance => _instance ??= _HomeService._init();
  _HomeService._init() : super(NetworkManager.instance);

  Future<BaseResponse<ProductModel>> getProduct() async {
    final response = await request<ProductModel, ProductModel>(path: NetworkPath.products, type: HttpType.get, responseEntityModel: ProductModel(), pathSuffix: "/1");
    return response;
  }
}
