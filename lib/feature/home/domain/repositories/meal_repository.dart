import 'package:dartz/dartz.dart';

import '../../../../product/errors/failures.dart';
import '../entities/meal_entity.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealEntity>>> getMealsByQuery(String query);

  Future<Either<Failure, MealEntity>> getMealsById(String id);

  Future<Either<Failure, List<MealEntity>>> listMealsByFirstLetter(
      String letter,
      );

  Future<Either<Failure, MealEntity>> lookupRandomMeal();

  Future<Either<Failure, List<MealEntity>>> searchMealsByName(String name);

  Future<Either<Failure, List<MealEntity>>> getMealsByCategory(String category);

  Future<Either<Failure, List<MealEntity>>> getMealsByArea(String area);


}