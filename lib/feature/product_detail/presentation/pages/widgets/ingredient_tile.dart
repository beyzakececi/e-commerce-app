import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final List<String> ingredients;
  final List<String> measures;

  IngredientTile({required this.ingredients, required this.measures});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(ingredients[index]),
          subtitle: Text(measures[index]),
        );
      },
    );
  }
}
