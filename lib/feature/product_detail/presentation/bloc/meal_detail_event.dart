import 'package:equatable/equatable.dart';

abstract class MealDetailEvent extends Equatable {
  const MealDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchMealDetail extends MealDetailEvent {
  final String id;

  const FetchMealDetail(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleFavorite extends MealDetailEvent {
  final String id;

  const ToggleFavorite(this.id);

  @override
  List<Object?> get props => [id];
}

class UpdateQuantity extends MealDetailEvent {
  final int quantity;

  const UpdateQuantity(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class UpdateRating extends MealDetailEvent {
  final double rating;

  const UpdateRating(this.rating);

  @override
  List<Object?> get props => [rating];
}
