import '../../../explore/domain/entities/meal.dart';
import '../../../explore/domain/repositories/meal_repository.dart';

class GetMealDetail {
  final MealRepository repository;

  GetMealDetail(this.repository);

  Future<Meal> call(String mealId) {
    return repository.getMealDetail(mealId);
  }
}
