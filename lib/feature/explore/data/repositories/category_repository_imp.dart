import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_datasource.dart';
import '../model/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource categoryDatasource;

  CategoryRepositoryImpl(this.categoryDatasource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await categoryDatasource.fetchCategories();
      final categories = (response.data['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}