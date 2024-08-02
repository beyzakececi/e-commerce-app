import 'package:flutter/material.dart';

import '../../../../domain/entities/meal_summary.dart';

class MealTile extends StatelessWidget {
  final MealSummary meal;
  final double price;

  MealTile({required this.meal, this.price = 1.99});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              meal.strMealThumb,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        // Handle add to cart functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
