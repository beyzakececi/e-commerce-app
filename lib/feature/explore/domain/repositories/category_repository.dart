import 'package:e_commerce/feature/explore/data/model/category_model.dart';

import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();
}
