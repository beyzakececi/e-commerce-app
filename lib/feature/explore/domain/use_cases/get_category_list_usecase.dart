import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/no_params.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategoryListUseCase extends UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetCategoryListUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}