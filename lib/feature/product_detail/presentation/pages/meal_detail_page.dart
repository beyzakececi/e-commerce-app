import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/di/injector.dart';
import '../../../cart/data/model/cart_item_model.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../domain/use_cases/get_metail_detail_usecase.dart';
import '../../domain/use_cases/update_meal_detail_usecase.dart';
import '../bloc/meal_detail_bloc.dart' ;
import '../bloc/meal_detail_event.dart' as m;
import '../bloc/meal_detail_state.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDetailBloc(
        getMealDetailUseCase: sl<GetMealDetailUseCase>(),
        updateMealDetailUseCase: sl<UpdateMealDetailUseCase>(),
      )..add(m.FetchMealDetail(mealId)),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<MealDetailBloc, MealDetailState>(
            builder: (context, state) {
              if (state is MealDetailLoaded) {
                return Text(state.mealDetail.name);
              }
              return Text('Meal Detail');
            },
          ),
        ),
        body: BlocBuilder<MealDetailBloc, MealDetailState>(
          builder: (context, state) {
            if (state is MealDetailLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MealDetailLoaded) {
              final meal = state.mealDetail;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(meal.thumbnail),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.name,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(meal.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              context
                                  .read<MealDetailBloc>()
                                  .add(m.ToggleFavorite(mealId));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1kg, Price',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$4.99',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (meal.quantity > 1) {
                                    context
                                        .read<MealDetailBloc>()
                                        .add(m.UpdateQuantity(meal.quantity - 1));
                                  }
                                },
                              ),
                              Text(
                                meal.quantity.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  context
                                      .read<MealDetailBloc>()
                                      .add(m.UpdateQuantity(meal.quantity + 1));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ExpansionTile(
                        title: Text('Product Detail'),
                        children: [
                          ListTile(
                            title: Text(meal.instructions),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text('Ingredients'),
                        children: (meal.ingredients ?? [])
                            .asMap()
                            .entries
                            .map((entry) => ListTile(
                                  title: Text(
                                      '${entry.value} - ${meal.measures?[entry.key]}'),
                                ))
                            .toList(),
                      ),
                      Row(
                        children: [
                          Text('Review'),
                          Text('⭐⭐⭐⭐⭐'),
                          // Add more review details here
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 20),
                            ),
                            child: Text(
                              'Add To Basket',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
