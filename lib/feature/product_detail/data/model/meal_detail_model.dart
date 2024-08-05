import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/meal_detail_entity.dart';

part 'meal_detail_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class MealDetailModel extends MealDetailEntity {
  @HiveField(0)
  final String idMeal;
  @HiveField(1)
  final String strMeal;
  @HiveField(2)
  final String strMealThumb;
  @HiveField(3)
  final String strInstructions;
  @HiveField(4)
  final List<String>? ingredients;
  @HiveField(5)
  final List<String>? measures;
  @HiveField(6)
  bool isFavorite;
  @HiveField(7)
  int quantity;
  @HiveField(8)
  double rating;

  MealDetailModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.strInstructions,
    this.ingredients,
    this.measures,
    this.isFavorite = false,
    this.quantity = 1,
    this.rating = 0.0,
  }) : super(
          id: idMeal,
          name: strMeal,
          thumbnail: strMealThumb,
          instructions: strInstructions,
          ingredients: ingredients,
          measures: measures,
          isFavorite: isFavorite,
          quantity: quantity,
          rating: rating,
        );

  factory MealDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MealDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailModelToJson(this);

  factory MealDetailModel.fromEntity(MealDetailEntity entity) =>
      MealDetailModel(
        idMeal: entity.id ?? '',
        strMeal: entity.name ?? '',
        strMealThumb: entity.thumbnail ?? '',
        strInstructions: entity.instructions ?? '',
        ingredients: entity.ingredients ?? [],
        measures: entity.measures ?? [] ,
        isFavorite: entity.isFavorite,
        quantity: entity.quantity,
        rating: entity.rating,
      );

  MealDetailEntity toEntity() {
    return MealDetailEntity(
      id: idMeal,
      name: strMeal,
      thumbnail: strMealThumb,
      instructions: strInstructions,
      ingredients: ingredients,
      measures: measures,
      isFavorite: isFavorite,
      quantity: quantity,
      rating: rating,
    );
  }

  @override
  MealDetailModel copyWith({
    String? id,
    String? name,
    String? thumbnail,
    String? instructions,
    List<String>? ingredients,
    List<String>? measures,
    bool? isFavorite,
    int? quantity,
    double? rating,
  }) {
    return MealDetailModel(
      idMeal: id ?? this.idMeal,
      strMeal: name ?? this.strMeal,
      strMealThumb: thumbnail ?? this.strMealThumb,
      strInstructions: instructions ?? this.strInstructions,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
    );
  }
}
