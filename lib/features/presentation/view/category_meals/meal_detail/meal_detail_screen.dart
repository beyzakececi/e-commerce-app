import 'package:flutter/material.dart';

import '../../../../domain/entities/meal/meal.dart';
import '../../../viewmodel/category_meals/category_meals_viewmodel.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  Widget build(BuildContext context) {
    final viewModel = CategoryMealsViewModel(category: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<Meal>(
        future: viewModel.getMealDetail(mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading meal details'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No meal details found'));
          } else {
            final meal = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(meal.strMealThumb, fit: BoxFit.cover),
                    SizedBox(height: 16),
                    Text(meal.strMeal, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(meal.strCategory, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                    SizedBox(height: 8),
                    Text(meal.strInstructions),
                    // Add other meal details as needed
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
