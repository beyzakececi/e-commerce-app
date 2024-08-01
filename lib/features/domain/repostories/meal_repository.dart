import '../entities/meal/meal.dart';
import '../entities/meal/meal_summary.dart';

abstract class MealRepository {
  Future<List<MealSummary>> getMealsByCategory(String category);
  Future<Meal> getMealDetail(String mealId);
}
