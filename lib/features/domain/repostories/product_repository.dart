

import '../entities/product/product_entity.dart';

abstract class ProductRepository {


  /// -- GET PRODUCTS --
  Future<ProductsEntity> getProducts();


  /// -- GET TYPES --
  //Future<ProductTypesEntity> getTypes();
}