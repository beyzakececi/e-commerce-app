import 'package:e_commerce/product/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../product/di/injector.dart';
import '../../../domain/entities/category.dart';
import '../../../../home/presentation/bloc/meals_bloc.dart';
import '../filter/filter_screen.dart';
import 'widgets/meal_tile.dart';
import '../../../../home/domain/entities/meal_entity.dart';

class CategoryMealsScreen extends StatelessWidget {
  final CategoryEntity category;

  CategoryMealsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name ?? 'Category Meals'),
        actions: [
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => FilterScreen(),
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<MealsBloc>()..add(FetchMealsByCategory(category.name!)),
        child: BlocBuilder<MealsBloc, MealsState>(
          builder: (context, state) {
            if (state is MealsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MealsLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
                  childAspectRatio: MediaQuery.of(context).size.width < 600 ? 0.75 : 0.85,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  final meal = state.meals[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouteName.mealDetail.path,
                        extra: meal,
                      );
                    },
                    child: MealTile(meal: meal, index: index),
                  );
                },
              );
            } else if (state is MealsError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
