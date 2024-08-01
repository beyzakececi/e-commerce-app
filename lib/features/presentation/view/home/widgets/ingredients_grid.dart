import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/cart_item_model.dart';
import '../../../../data/models/ingredient_model.dart';
import '../../../viewmodel/cart/cart_viewmodel.dart';
import '../../../viewmodel/ingredients/ingredients_viewmodel.dart';
import '../../app/widgets/image/custom_image_widget.dart';


class IngredientsGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientsAsyncValue = ref.watch(ingredientsProvider);

    return ingredientsAsyncValue.when(
      data: (ingredients) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          return IngredientCard(ingredient: ingredient);
        },
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Failed to load ingredients')),
    );
  }
}

class IngredientCard extends ConsumerWidget {
  final Ingredient ingredient;

  IngredientCard({required this.ingredient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(
              image: 'https://www.themealdb.com/images/ingredients/${ingredient.strIngredient}-Small.png',
              height: 80,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            Text(
              ingredient.strIngredient,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              ingredient.strDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              '\$4.99',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  ref.read(cartViewModelProvider.notifier).addItem(
                    CartItem(
                      id: ingredient.idIngredient,
                      name: ingredient.strIngredient,
                      imageUrl: 'https://www.themealdb.com/images/ingredients/${ingredient.strIngredient}-Small.png',
                      quantity: '1',
                      price: 4.99,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
