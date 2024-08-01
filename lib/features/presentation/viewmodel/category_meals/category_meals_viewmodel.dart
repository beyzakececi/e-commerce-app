import '../../../data/repositories/meal_repository_imp.dart';
import '../../../domain/entities/meal/meal.dart';
import '../../../domain/entities/meal/meal_summary.dart';
import '../../../domain/usecases/get_meals_by_category.dart';
import '../../../domain/usecases/get_meal_detail.dart';

class CategoryMealsViewModel {
  final String category;
  final GetMealsByCategory _getMealsByCategory;
  final GetMealDetail _getMealDetail;

  CategoryMealsViewModel({required this.category})
      : _getMealsByCategory = GetMealsByCategory(MealRepositoryImpl()),
        _getMealDetail = GetMealDetail(MealRepositoryImpl());

  Future<List<MealSummary>> getMeals() {
    return _getMealsByCategory(category);
  }

  Future<Meal> getMealDetail(String mealId) {
    return _getMealDetail(mealId);
  }
}
