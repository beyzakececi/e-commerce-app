import 'package:e_commerce/features/presentation/view/category_meals/widgets/meal_tile.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/meal/meal_summary.dart';
import '../../viewmodel/category_meals/category_meals_viewmodel.dart';
import '../filter/filter_screen.dart';
import 'meal_detail/meal_detail_screen.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String category;

  CategoryMealsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final viewModel = CategoryMealsViewModel(category: category);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        title: Text(category),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black), // Filter icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterScreen(), // Navigate to filter screen
                ),
              );
            },
          ),
        ],
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
                        builder: (context) => MealDetailPage(mealId: snapshot.data![index].idMeal),
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