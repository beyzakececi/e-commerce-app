import 'package:flutter/cupertino.dart';

import '../../../../core/api/api_response.dart';
import '../../../domain/entities/product/product_entity.dart';


abstract class ProductViewModel extends ChangeNotifier {

  ///  -- GET PRODUCTS --
  ApiResponse<ProductsEntity> get getProductsResponse;

  set getProductsResponse(ApiResponse<ProductsEntity> value);

  Future<void> getProducts();


  /// -- GET PRODUCT TYPE BY ID --
  String getProductTypeById({required String id});


}