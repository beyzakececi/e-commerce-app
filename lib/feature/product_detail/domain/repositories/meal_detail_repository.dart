import 'package:dartz/dartz.dart';
import '../../../../product/errors/failures.dart';
import '../entities/meal_detail_entity.dart';

abstract class MealDetailRepository {
  Future<Either<Failure, MealDetailEntity>> getMealDetail(String id);
  Future<Either<Failure, void>> updateMealDetail(MealDetailEntity mealDetail);
}
