

import '../../../core/usecases/base_usecase.dart';
import '../entities/product/product_entity.dart';
import '../repostories/product_repository.dart';

class ParamsBase {
  const ParamsBase();
}


/// -- GET PRODUCTS --
class GetProducts extends BaseUseCase<Future<ProductsEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  @override
  Future<ProductsEntity> execute(ParamsBase params) async {
    return await productRepository.getProducts();
  }
}

/*
/// -- GET TYPES --
class GetProductTypes extends BaseUseCase<Future<ProductTypesEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetProductTypes({required this.productRepository});

  @override
  Future<ProductTypesEntity> execute(ParamsBase params) async {
    return await productRepository.getTypes();
  }
}


 */
