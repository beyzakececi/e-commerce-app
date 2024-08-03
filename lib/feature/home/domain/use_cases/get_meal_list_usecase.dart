import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/meal_entity.dart';
import '../repositories/meal_repository.dart';

class GetMealListUseCase extends UseCase<List<MealEntity>, String> {
  final MealRepository repository;

  GetMealListUseCase(this.repository);

  @override
  Future<Either<Failure, List<MealEntity>>> call(params) async {
    return await repository.getMealsByQuery(params);
  }
}