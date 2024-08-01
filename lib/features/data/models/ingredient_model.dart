import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class Ingredient {
  final String idIngredient;
  final String strIngredient;
  final String strDescription;

  Ingredient({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
