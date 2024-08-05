import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../product/di/injector.dart';
import '../../../../product/usecases/no_params.dart';
import '../../domain/entities/meal_entity.dart';
import '../../domain/use_cases/get_meal_by_id_usecase.dart';
import '../../domain/use_cases/get_meal_list_by_category_usecase.dart';
import '../../domain/use_cases/get_meal_list_usecase.dart';
import '../../domain/use_cases/get_meals_list_by_area_usecase.dart';
import '../../domain/use_cases/lists_meals_by_first_letter_usecase.dart';
import '../../domain/use_cases/random_meal_usecase.dart';
import '../../domain/use_cases/search_meals_by_name_usecase.dart';

part 'meals_event.dart';

part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final GetMealListUseCase getMealsUsecase;
  final GetMealListByCategoryUseCase getMealListByCategoryUseCase;
  final GetMealListByAreaUseCase getMealListByAreaUseCase;
  final LookupRandomMealUseCase lookupRandomMealUseCase;


  MealsBloc({
    required this.getMealsUsecase,
    required this.getMealListByCategoryUseCase,
    required this.getMealListByAreaUseCase,
    required this.lookupRandomMealUseCase,
  }) : super(MealsInitial()) {
    on<GetMealsByQuery>((event, emit) async {
      emit(MealsLoading());
      final result = await getMealsUsecase.call(event.query);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meals) => emit(MealsLoaded(meals)),
      );
    });

    on<GetMealById>((event, emit) async {
      emit(MealsLoading());
      final result = await sl<GetMealByIdUseCase>().call(event.id);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meal) => emit(MealLoaded(meal)),
      );
    });

    on<ListMealsByFirstLetter>((event, emit) async {
      emit(MealsLoading());
      final result =
          await sl<ListMealsByFirstLetterUseCase>().call(event.letter);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meals) => emit(MealsLoaded(meals)),
      );
    });

    on<LookupRandomMeal>((event, emit) async {
      emit(MealsLoading());
      List<MealEntity> meals = [];
      for (int i = 0; i < 5; i++) {
        final result = await sl<LookupRandomMealUseCase>().call(NoParams());
        result.fold(
              (failure) => emit(MealsError(failure.toString())),
              (meal) => meals.add(meal),
        );
      }
      emit(MealsLoaded(meals));
    });

    on<SearchMealsByName>((event, emit) async {
      emit(MealsLoading());
      final result = await sl<SearchMealsByNameUseCase>().call(event.name);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meals) => emit(MealsLoaded(meals)),
      );
    });

    on<FetchMealsByCategory>((event, emit) async {
      emit(MealsLoading());
      final result =
          await sl<GetMealListByCategoryUseCase>().call(event.category);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meals) => emit(MealsLoaded(meals)),
      );
    });

    on<FetchMealsByArea>((event, emit) async {
      emit(MealsLoading());
      if (event.area == "") {
        emit(MealsLoaded([]));
        return;
      }

      final result = await getMealListByAreaUseCase(event.area);

      result.fold(
        (failure) => emit(MealsError(failure.toString())),
        (meals) => emit(MealsLoaded(meals)),
      );
    });


  }
}
