import '../../data/models/ingredient_model.dart';
import '../../data/repositories/ingredients_repository.dart';

class GetIngredientsUseCase {
  final IngredientsRepository repository;

  GetIngredientsUseCase(this.repository);

  Future<List<Ingredient>> call() async {
    return await repository.getIngredients();
  }
}
