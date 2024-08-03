import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/category.dart';

class CategoryTile extends StatelessWidget {
  final CategoryEntity category;
  final int index;

  CategoryTile({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.3;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return GestureDetector(
      onTap: () {
        context.push('/category-meals', extra: category);

      },
      child: Container(
        decoration: BoxDecoration(
          color: _getColorByIndex(index).withOpacity(0.1), // Açık renk arka plan
          border: Border.all(color: _getColorByIndex(index), width: 2), // Daha koyu kenarlık
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                category.thumbnail!,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: Text(
                category.name!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorByIndex(int index) {
    List<Color> colors = [
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.blue,
      Colors.pink,
      Colors.teal,
      Colors.brown,
      Colors.cyan,
    ];
    return colors[index % colors.length];
  }
}
