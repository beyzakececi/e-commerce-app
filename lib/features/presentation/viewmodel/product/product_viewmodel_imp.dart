import 'package:e_commerce/features/presentation/viewmodel/product/product_viewmodel.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/api/api_response.dart';
import '../../../../di/injection_container.dart';
import '../../../domain/entities/product/product_entity.dart';


class ProductViewModelImp extends ChangeNotifier implements ProductViewModel {


  ///  -- GET PRODUCTS --
  ApiResponse<ProductsEntity> _getProductsResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<ProductsEntity> get getProductsResponse => _getProductsResponse;

  @override
  set getProductsResponse(ApiResponse<ProductsEntity> value) {
    _getProductsResponse = value;
    notifyListeners();
  }

  ///

  @override
  Future<void> getProducts() async {
    getProductsResponse = ApiResponse.loading("loading");
    try {
      //final ProductsEntity productsEntity = await injector<GetProducts>().execute();
      //getProductsResponse = ApiResponse.completed(productsEntity);
    } catch (e, stackTrace) {
      //getProductsResponse = ApiResponse.error(e, stackTrace);
    }
  }

  @override
  String getProductTypeById({required String id}) {
    // TODO: implement getProductTypeById
    throw UnimplementedError();
  }
  


}