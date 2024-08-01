import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../data/models/meal_summary_model.dart';
import '../../../../domain/entities/meal/meal.dart';
import '../../../viewmodel/category_meals/category_meals_viewmodel.dart';
import 'package:go_router/go_router.dart';

class MealDetailPage extends StatefulWidget {
  final String mealId;

  MealDetailPage({required this.mealId});

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final viewModel = CategoryMealsViewModel(category: '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<Meal>(
        future: viewModel.getMealDetail(widget.mealId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading meal details'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No meal details found'));
          } else {
            final meal = snapshot.data!;
            final ingredients = _getNonNullIngredients(meal);
            final measures = _getNonNullMeasures(meal);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(meal.strMealThumb, fit: BoxFit.cover),
                    SizedBox(height: 16),
                    _buildMealHeader(meal),
                    SizedBox(height: 8),
                    _buildQuantitySelector(),
                    Divider(),
                    _buildIngredientsSection(ingredients, measures),
                    Divider(),
                    _buildInstructionsSection(meal),
                    Divider(),
                    _buildReviewsSection(),
                    SizedBox(height: 16),
                    _buildAddToBasketButton(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildMealHeader(Meal meal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          meal.strMeal,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        FavoriteIconButton(
          mealId: meal.idMeal,
          strMeal: meal.strMeal,
          strMealThumb: meal.strMealThumb,
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
            Text('$quantity', style: TextStyle(fontSize: 18)),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ],
        ),
        Text(
          '\$10.00',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildIngredientsSection(List<String> ingredients, List<String> measures) {
    return ExpansionTile(
      title: Text('Ingredients'),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ingredients[index]),
              trailing: Text(measures[index]),
            );
          },
        ),
      ],
    );
  }

  Widget _buildInstructionsSection(Meal meal) {
    return ExpansionTile(
      title: Text('Instructions'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(meal.strInstructions),
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Row(
      children: [
        Text('Reviews', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Text('4.5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Icon(Icons.star, color: Colors.yellow),
      ],
    );
  }

  Widget _buildAddToBasketButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle add to basket action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text('Add To Basket', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  List<String> _getNonNullIngredients(Meal meal) {
    return [
      meal.strIngredient1,
      meal.strIngredient2,
      meal.strIngredient3,
      // Add more ingredients if needed
    ].where((ingredient) => ingredient != null && ingredient.isNotEmpty).toList();
  }

  List<String> _getNonNullMeasures(Meal meal) {
    return [
      meal.strMeasure1,
      meal.strMeasure2,
      meal.strMeasure3,
      // Add more measures if needed
    ].where((measure) => measure != null && measure.isNotEmpty).toList();
  }
}

class FavoriteIconButton extends StatefulWidget {
  final String mealId;
  final String strMeal;
  final String strMealThumb;

  const FavoriteIconButton({
    required this.mealId,
    required this.strMeal,
    required this.strMealThumb,
  });

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    final box = Hive.box<MealSummaryModel>('favorites');
    final favorite = box.get(widget.mealId);
    setState(() {
      isFavorite = favorite != null;
    });
  }

  Future<void> _toggleFavorite() async {
    final box = Hive.box<MealSummaryModel>('favorites');
    if (isFavorite) {
      await box.delete(widget.mealId);
    } else {
      final favorite = MealSummaryModel(
        idMeal: widget.mealId,
        strMeal: widget.strMeal,
        strMealThumb: widget.strMealThumb,
      );
      await box.put(favorite.idMeal, favorite);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
