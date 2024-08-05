import 'package:equatable/equatable.dart';
import '../../domain/entities/meal_detail_entity.dart';

abstract class MealDetailState extends Equatable {
  const MealDetailState();

  @override
  List<Object> get props => [];
}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final MealDetailEntity mealDetail;

  const MealDetailLoaded(this.mealDetail);

  @override
  List<Object> get props => [mealDetail];
}

class MealDetailError extends MealDetailState {
  final String message;

  const MealDetailError(this.message);

  @override
  List<Object> get props => [message];
}
