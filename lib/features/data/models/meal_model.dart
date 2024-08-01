import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/meal/meal.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel extends Meal {
  MealModel({
    required String idMeal,
    required String strMeal,
    String? strDrinkAlternate,
    required String strCategory,
    required String strArea,
    required String strInstructions,
    required String strMealThumb,
    String? strTags,
    required String strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    // Add up to strIngredient20
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    // Add up to strMeasure20
    String? strSource,
    String? strImageSource,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
  }) : super(
    idMeal: idMeal,
    strMeal: strMeal,
    strDrinkAlternate: strDrinkAlternate ?? '',
    strCategory: strCategory,
    strArea: strArea,
    strInstructions: strInstructions,
    strMealThumb: strMealThumb,
    strTags: strTags ?? '',
    strYoutube: strYoutube,
    strIngredient1: strIngredient1 ?? '',
    strIngredient2: strIngredient2 ?? '',
    strIngredient3: strIngredient3 ?? '',
    // Add up to strIngredient20
    strMeasure1: strMeasure1 ?? '',
    strMeasure2: strMeasure2 ?? '',
    strMeasure3: strMeasure3 ?? '',
    // Add up to strMeasure20
    strSource: strSource ?? '',
    strImageSource: strImageSource ?? '',
    strCreativeCommonsConfirmed: strCreativeCommonsConfirmed ?? '',
    dateModified: dateModified ?? '',
  );

  factory MealModel.fromJson(Map<String, dynamic> json) => _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
