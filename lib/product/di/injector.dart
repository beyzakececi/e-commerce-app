import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import '../../feature/explore/data/datasources/category_datasource.dart';
import '../../feature/explore/data/repositories/category_repository_imp.dart';
import '../../feature/explore/domain/repositories/category_repository.dart';
import '../../feature/explore/domain/use_cases/get_category_list_usecase.dart';
import '../../feature/explore/presentation/bloc/categories_bloc.dart';
import '../../feature/home/data/datasources/meal_datasource.dart';
import '../../feature/home/data/repositories/meal_repository_impl.dart';
import '../../feature/home/domain/repositories/meal_repository.dart';
import '../../feature/home/domain/use_cases/get_meal_by_id_usecase.dart';
import '../../feature/home/domain/use_cases/get_meal_list_by_category_usecase.dart';
import '../../feature/home/domain/use_cases/get_meal_list_usecase.dart';
import '../../feature/home/domain/use_cases/get_meals_list_by_area_usecase.dart';
import '../../feature/home/domain/use_cases/lists_meals_by_first_letter_usecase.dart';
import '../../feature/home/domain/use_cases/random_meal_usecase.dart';
import '../../feature/home/domain/use_cases/search_meals_by_name_usecase.dart';
import '../../feature/home/presentation/bloc/meals_bloc.dart';
import '../errors/failures.dart';
import '../network/network_info.dart';
import '../network/network_service.dart';
import '../router/go_router.dart';


final sl = GetIt.instance;

void init(){

  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => NetworkService(sl()));
  sl.registerLazySingleton(() => AppRoutes.instance.router);

  // Errors
  sl.registerLazySingleton<Failure>(
        () => ServerFailure(),
    instanceName: 'server',
  );
  sl.registerLazySingleton<Failure>(
        () => CacheFailure(),
    instanceName: 'cache',
  );

  // ================================================================
  // Features - Meals

  // Datasources
  sl.registerLazySingleton(() => MealDatasource(sl()));

  // Usecases
  sl.registerLazySingleton(() => GetMealListUseCase(sl()));
  sl.registerLazySingleton(() => GetMealByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetMealListByCategoryUseCase(sl()));
  sl.registerLazySingleton(() => ListMealsByFirstLetterUseCase(sl()));
  sl.registerLazySingleton(() => LookupRandomMealUseCase(sl()));
  sl.registerLazySingleton(() => SearchMealsByNameUseCase(sl()));
  sl.registerLazySingleton(() => GetMealListByAreaUseCase(sl()));


  // Repository
  sl.registerLazySingleton<MealRepository>(
      ()=>MealRepositoryImpl(
        sl(),
      ),
  );

  // Bloc
  sl.registerFactory(
        () => MealsBloc(
      getMealsUsecase: sl(),

    ),
  );

  // ================================================================
  // Features - Categories

  // Datasources
  sl.registerLazySingleton(() => CategoryDatasource(sl()));
  // Usecases
  sl.registerLazySingleton(() => GetCategoryListUseCase(sl()));
  // Repository
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));

  // Bloc
  sl.registerFactory(
        () => CategoriesBloc(
      getCategoriesUsecase: sl(),
    ),
  );

}