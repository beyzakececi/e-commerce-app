import '../../../data/repositories/category_repository_imp.dart';
import '../../../domain/entities/category/category.dart';
import '../../../domain/usecases/get_categories.dart';

class ExploreViewModel {
  final GetCategories _getCategories;

  ExploreViewModel() : _getCategories = GetCategories(CategoryRepositoryImpl());

  Future<List<Category>> getCategories() {
    return _getCategories();
  }
}
