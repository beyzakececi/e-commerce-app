import 'package:dartz/dartz.dart';
import '../../../../product/errors/failures.dart';
import '../../../../product/usecases/usecase.dart';
import '../../../home/domain/repositories/meal_repository.dart';
import '../entities/meal_entity.dart';

class GetMealByIdUseCase extends UseCase<MealEntity, String> {
  final MealRepository repository;

  GetMealByIdUseCase(this.repository);

  @override
  Future<Either<Failure, MealEntity>> call(params) async {
    return await repository.getMealsById(params);
  }
}