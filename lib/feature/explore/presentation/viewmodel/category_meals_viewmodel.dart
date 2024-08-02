import '../../../product_detail/data/repositories/meal_repository_imp.dart';
import '../../domain/entities/meal.dart';
import '../../domain/entities/meal_summary.dart';
import '../../domain/use_cases/get_meals_by_category.dart';
import '../../../product_detail/domain/use_cases/get_meal_detail.dart';

class CategoryMealsViewModel {
  final String category;
  final GetMealsByCategory _getMealsByCategory;
  final GetMealDetail _getMealDetail;

  CategoryMealsViewModel(this.category)
      : _getMealsByCategory = GetMealsByCategory(MealRepositoryImpl()),
        _getMealDetail = GetMealDetail(MealRepositoryImpl());

  Future<List<MealSummary>> getMeals() {
    return _getMealsByCategory(category);
  }

  Future<Meal> getMealDetail(String mealId) {
    return _getMealDetail(mealId);
  }
}
