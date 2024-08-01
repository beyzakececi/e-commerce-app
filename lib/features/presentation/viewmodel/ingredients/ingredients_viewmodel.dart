import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/datasources/ingredients_datasource.dart';
import '../../../data/repositories/ingredients_repository.dart';
import '../../../domain/usecases/get_ingredients_usecase.dart';
import '../../../data/models/ingredient_model.dart';

final ingredientsProvider = FutureProvider<List<Ingredient>>((ref) async {
  final datasource = IngredientsDatasource();
  final repository = IngredientsRepository(datasource);
  final usecase = GetIngredientsUseCase(repository);
  return await usecase();
});
