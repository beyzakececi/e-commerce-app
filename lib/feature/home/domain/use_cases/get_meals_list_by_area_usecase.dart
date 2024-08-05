import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/meal_entity.dart';
import '../repositories/meal_repository.dart';

class GetMealListByAreaUseCase implements UseCase<List<MealEntity>, String> {
  final MealRepository repository;

  GetMealListByAreaUseCase(this.repository);

  @override
  Future<Either<Failure, List<MealEntity>>> call(String area) async {
    return await repository.getMealsByArea(area);
  }
}
