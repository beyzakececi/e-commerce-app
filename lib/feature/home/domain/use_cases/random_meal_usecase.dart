import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/no_params.dart';
import '../../../../product/usecases/usecase.dart';
import '../entities/meal_entity.dart';
import '../repositories/meal_repository.dart';

class LookupRandomMealUseCase extends UseCase<MealEntity, NoParams> {
  final MealRepository repository;

  LookupRandomMealUseCase(this.repository);

  @override
  Future<Either<Failure, MealEntity>> call(NoParams params) async {
    return await repository.lookupRandomMeal();
  }
}