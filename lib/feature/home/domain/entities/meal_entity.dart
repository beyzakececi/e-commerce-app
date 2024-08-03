import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String id;
  final String name;
  final String? thumbnail;
  final String? category;
  final String? area;
  final String? instructions;
  final String? tags;
  final String? youtube;
  final String? source;
  final String? imageSource;
  final bool? isFavorite;
  final List<String> ingredients;
  final List<String> measures;

  const MealEntity({
    required this.id,
    required this.name,
    this.thumbnail,
    this.category,
    this.area,
    this.instructions,
    this.tags,
    this.youtube,
    this.source,
    this.imageSource,
    this.isFavorite,
    required this.ingredients,
    required this.measures,
  });

  factory MealEntity.fromJson(Map<String, dynamic> json) {
    final ingredients = <String>[];
    final measures = <String>[];
    for (var i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'] != '') {
        ingredients.add(json['strIngredient$i']);
      }
      if (json['strMeasure$i'] != null && json['strMeasure$i'] != '') {
        measures.add(json['strMeasure$i']);
      }
    }
    return MealEntity(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      tags: json['strTags'],
      youtube: json['strYoutube'],
      source: json['strSource'],
      imageSource: json['strImageSource'],
      isFavorite: json['isFavorite'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    thumbnail,
    category,
    area,
    instructions,
    tags,
    youtube,
    source,
    imageSource,
    isFavorite,
    ingredients,
    measures,
  ];
}
