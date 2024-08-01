import '../datasources/ingredients_datasource.dart';
import '../models/ingredient_model.dart';

class IngredientsRepository {
  final IngredientsDatasource datasource;

  IngredientsRepository(this.datasource);

  Future<List<Ingredient>> getIngredients() async {
    return await datasource.fetchIngredients();
  }
}
