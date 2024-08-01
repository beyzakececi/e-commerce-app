import 'package:flutter/material.dart';
import '../../../../domain/entities/category/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final int index;

  CategoryTile({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getColorByIndex(index),
      child: Column(
        children: [
          Expanded(
            child: Image.network(category.strCategoryThumb, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(category.strCategory),
          ),
        ],
      ),
    );
  }

  Color _getColorByIndex(int index) {
    List<Color> colors = [
      Colors.green[100]!,
      Colors.orange[100]!,
      Colors.red[100]!,
      Colors.purple[100]!,
      Colors.yellow[100]!,
      Colors.blue[100]!,
      Colors.pink[100]!,
      Colors.teal[100]!,
      Colors.brown[100]!,
      Colors.cyan[100]!,
    ];
    return colors[index % colors.length];
  }
}
