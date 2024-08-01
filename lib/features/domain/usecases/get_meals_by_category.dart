import '../entities/meal/meal_summary.dart';
import '../repostories/meal_repository.dart';

class GetMealsByCategory {
  final MealRepository repository;

  GetMealsByCategory(this.repository);

  Future<List<MealSummary>> call(String category) {
    return repository.getMealsByCategory(category);
  }
}
