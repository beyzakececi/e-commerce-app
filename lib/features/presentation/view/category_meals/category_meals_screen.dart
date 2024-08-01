import 'package:flutter/material.dart';
import 'package:e_commerce/features/presentation/view/category_meals/widgets/meal_tile.dart';
import '../../../domain/entities/meal/meal_summary.dart';
import '../../viewmodel/category_meals/category_meals_viewmodel.dart';
import 'meal_detail/meal_detail_screen.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String category;

  CategoryMealsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final viewModel = CategoryMealsViewModel(category: category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<MealSummary>>(
        future: viewModel.getMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading meals'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No meals found'));
          } else {
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailScreen(mealId: snapshot.data![index].idMeal),
                      ),
                    );
                  },
                  child: MealTile(meal: snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
