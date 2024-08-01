import '../entities/category/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
