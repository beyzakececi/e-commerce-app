import 'package:flutter/material.dart';
import 'package:e_commerce/feature/home/domain/entities/meal_entity.dart';

class MealTile extends StatelessWidget {
  final MealEntity meal;
  final int index;

  MealTile({required this.meal, required this.index});

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.3;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Image.network(
              meal.thumbnail!,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Flexible(
            flex: 1,
            child: Text(
              meal.name!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$10.00',
                  style: TextStyle(fontSize: 18.0
                    , fontWeight: FontWeight.bold,),
                ),
                IconButton(
                  icon: Icon(Icons.add_box_rounded, color: Colors.green, size: 40.0),
                  onPressed: () {
                    // Add to cart functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
