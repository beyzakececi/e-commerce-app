import 'package:e_commerce/feature/explore/data/model/category_model.dart';

import '../../data/repositories/category_repository_imp.dart';
import '../../domain/entities/category.dart';
import '../../domain/use_cases/get_categories.dart';

class ExploreViewModel {
  final GetCategories _getCategories;

  ExploreViewModel() : _getCategories = GetCategories(CategoryRepositoryImpl());

  Future<List<CategoryModel>> getCategories() {
    return _getCategories();
  }
}
