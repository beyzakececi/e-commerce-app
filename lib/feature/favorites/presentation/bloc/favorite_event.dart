import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/meal_entity.dart';
import '../../../product_detail/domain/entities/meal_detail_entity.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  final MealDetailEntity meal;

  const AddToFavorite(this.meal);

  @override
  List<Object> get props => [meal];
}

class RemoveFromFavorite extends FavoriteEvent {
  final String mealId;

  const RemoveFromFavorite(this.mealId);

  @override
  List<Object> get props => [mealId];
}

class AddAllToCart extends FavoriteEvent {}
