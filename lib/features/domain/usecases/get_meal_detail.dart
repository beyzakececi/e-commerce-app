import '../entities/meal/meal.dart';
import '../repostories/meal_repository.dart';

class GetMealDetail {
  final MealRepository repository;

  GetMealDetail(this.repository);

  Future<Meal> call(String mealId) {
    return repository.getMealDetail(mealId);
  }
}
