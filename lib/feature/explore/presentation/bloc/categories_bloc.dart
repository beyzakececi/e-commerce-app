import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../product/di/injector.dart';
import '../../../../product/usecases/no_params.dart';
import '../../domain/entities/category.dart';
import '../../domain/use_cases/get_category_list_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required GetCategoryListUseCase getCategoriesUsecase})
      : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoriesLoading());
      final result = await sl<GetCategoryListUseCase>().call(NoParams());
      result.fold(
            (failure) => emit(CategoriesError(failure.toString())),
            (categories) => emit(CategoriesLoaded(categories)),
      );
    });
  }
}