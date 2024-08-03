import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/home/domain/entities/meal_entity.dart';
import 'package:e_commerce/feature/home/domain/repositories/meal_repository.dart';
import 'package:e_commerce/product/errors/failures.dart';

class GetMealListByCategoryUseCase {
  final MealRepository repository;

  GetMealListByCategoryUseCase(this.repository);

  Future<Either<Failure, List<MealEntity>>> call(String category) async {
    return await repository.getMealsByCategory(category);
  }
}
