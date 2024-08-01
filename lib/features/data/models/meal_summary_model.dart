import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/meal/meal_summary.dart';

part 'meal_summary_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class MealSummaryModel extends MealSummary {
  @HiveField(0)
  final String idMeal;

  @HiveField(1)
  final String strMeal;

  @HiveField(2)
  final String strMealThumb;

  @HiveField(3)
  final double price;

  MealSummaryModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    this.price = 10.0,
  }) : super(
    idMeal: idMeal,
    strMeal: strMeal,
    strMealThumb: strMealThumb,
  );

  factory MealSummaryModel.fromJson(Map<String, dynamic> json) => _$MealSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealSummaryModelToJson(this);
}
