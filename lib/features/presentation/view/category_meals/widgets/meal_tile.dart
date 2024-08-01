import 'package:flutter/material.dart';
import '../../../../domain/entities/meal/meal_summary.dart';

class MealTile extends StatelessWidget {
  final MealSummary meal;

  MealTile({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(meal.strMealThumb, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(meal.strMeal),
          ),
        ],
      ),
    );
  }
}
