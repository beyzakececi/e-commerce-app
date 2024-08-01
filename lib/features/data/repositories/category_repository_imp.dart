import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/category/category.dart';
import '../../domain/repostories/category_repository.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final List<dynamic> categoryJson = json.decode(response.body)['categories'];
      return categoryJson.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
