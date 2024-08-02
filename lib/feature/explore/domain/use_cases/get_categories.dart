import 'package:e_commerce/feature/explore/data/model/category_model.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryModel>> call() async {
    return await repository.getCategories();
  }
}
