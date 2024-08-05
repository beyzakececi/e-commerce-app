import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../product/constants/app_colors.dart';
import '../../../../app/presentation/view/widgets/custom_image.dart';
import '../../../../cart/data/model/cart_item_model.dart';
import '../../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../domain/entities/meal_entity.dart';

class HorizontalProductCart extends StatelessWidget {
  final MealEntity meal;

  const HorizontalProductCart({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // Adjust width to fit the horizontal layout
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.network(
              meal.thumbnail!,
              width: double.infinity,
              height: 100, // Adjust height to fit the card
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('1kg, Price'),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$10.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.add_box_rounded, color: Colors.green, size: 40.0),
                      onPressed: () {
                        final cartItem = CartItem(
                          id: meal.id,
                          name: meal.name ?? '',
                          imageUrl: meal.thumbnail ?? '',
                          price: 10, // You may want to get the actual price from meal if available
                          quantity: 1,
                        );
                        context.read<CartBloc>().add(AddItem(cartItem));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
