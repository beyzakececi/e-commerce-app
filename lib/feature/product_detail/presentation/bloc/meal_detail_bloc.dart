import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/meal_detail_entity.dart';
import '../../domain/use_cases/get_metail_detail_usecase.dart';
import '../../domain/use_cases/update_meal_detail_usecase.dart';
import 'meal_detail_event.dart';
import 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final GetMealDetailUseCase getMealDetailUseCase;
  final UpdateMealDetailUseCase updateMealDetailUseCase;

  MealDetailBloc({
    required this.getMealDetailUseCase,
    required this.updateMealDetailUseCase,
  }) : super(MealDetailInitial()) {
    on<FetchMealDetail>((event, emit) async {
      emit(MealDetailLoading());
      final result = await getMealDetailUseCase(event.id);
      result.fold(
            (failure) => emit(MealDetailError(failure.toString())),
            (mealDetail) => emit(MealDetailLoaded(mealDetail)),
      );
    });

    on<ToggleFavorite>((event, emit) async {
      final currentState = state;
      if (currentState is MealDetailLoaded) {
        final updatedMeal = currentState.mealDetail.copyWith(isFavorite: !currentState.mealDetail.isFavorite);
        await updateMealDetailUseCase(updatedMeal);
        emit(MealDetailLoaded(updatedMeal));
      }
    });

    on<UpdateQuantity>((event, emit) async {
      final currentState = state;
      if (currentState is MealDetailLoaded) {
        final updatedMeal = currentState.mealDetail.copyWith(quantity: event.quantity);
        await updateMealDetailUseCase(updatedMeal);
        emit(MealDetailLoaded(updatedMeal));
      }
    });

    on<UpdateRating>((event, emit) async {
      final currentState = state;
      if (currentState is MealDetailLoaded) {
        final updatedMeal = currentState.mealDetail.copyWith(rating: event.rating);
        await updateMealDetailUseCase(updatedMeal);
        emit(MealDetailLoaded(updatedMeal));
      }
    });
  }
}
