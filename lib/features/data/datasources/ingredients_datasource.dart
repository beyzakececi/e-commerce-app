import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ingredient_model.dart';

class IngredientsDatasource {
  Future<List<Ingredient>> fetchIngredients() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?i=list'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['meals'];
      return data.map((item) => Ingredient.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ingredients');
    }
  }
}
