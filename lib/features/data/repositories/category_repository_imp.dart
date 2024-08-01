import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/category/category.dart';
import '../../domain/repostories/category_repository.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';

  @override
  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> categoriesJson = data['categories'];
        return categoriesJson.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Failed to load categories');
    }
  }
}
