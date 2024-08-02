import '../entities/meal_summary.dart';
import '../repositories/meal_repository.dart';

class GetMealsByCategory {
  final MealRepository repository;

  GetMealsByCategory(this.repository);

  Future<List<MealSummary>> call(String category) {
    return repository.getMealsByCategory(category);
  }
}
