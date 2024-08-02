import 'dart:convert';
import 'package:e_commerce/feature/explore/data/model/category_model.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final categories = (body['categories'] as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
