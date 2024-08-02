import '../entities/meal.dart';
import '../entities/meal_summary.dart';

abstract class MealRepository {
  Future<List<MealSummary>> getMealsByCategory(String category);
  Future<Meal> getMealDetail(String mealId);
}
