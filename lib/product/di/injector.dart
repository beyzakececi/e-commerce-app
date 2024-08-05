import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../feature/explore/data/datasources/category_datasource.dart';
import '../../feature/explore/data/repositories/category_repository_imp.dart';
import '../../feature/explore/domain/repositories/category_repository.dart';
import '../../feature/explore/domain/use_cases/get_category_list_usecase.dart';
import '../../feature/explore/presentation/bloc/categories_bloc.dart';
import '../../feature/favorites/presentation/bloc/favorite_bloc.dart';
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
import '../../feature/product_detail/data/datasources/meal_detail_datasource.dart';
import '../../feature/product_detail/data/model/meal_detail_model.dart';
import '../../feature/product_detail/data/repositories/meal_detail_repository_impl.dart';
import '../../feature/product_detail/domain/repositories/meal_detail_repository.dart';
import '../../feature/product_detail/domain/use_cases/get_metail_detail_usecase.dart';
import '../../feature/product_detail/domain/use_cases/update_meal_detail_usecase.dart';
import '../../feature/product_detail/presentation/bloc/meal_detail_bloc.dart';
import '../../feature/cart/data/model/cart_item_model.dart';
import '../../feature/cart/presentation/bloc/cart_bloc.dart';
import '../errors/failures.dart';
import '../network/network_info.dart';
import '../network/network_service.dart';
import '../router/go_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Register adapters
  Hive.registerAdapter(MealDetailModelAdapter());
  Hive.registerAdapter(CartItemAdapter());


  // Open boxes
  final mealDetailBox = await Hive.openBox<MealDetailModel>('mealDetailBox');
  final cartBox = await Hive.openBox<CartItem>('cartBox');
  final favoriteBox = await Hive.openBox<MealDetailModel>('favoriteBox');

  // Register Hive boxes
  sl.registerSingleton<Box<MealDetailModel>>(mealDetailBox);
  sl.registerSingleton<Box<CartItem>>(cartBox);

  // Core
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => NetworkService(sl()));
  sl.registerLazySingleton(() => AppRoutes.instance.router);

  // Errors
  sl.registerLazySingleton<Failure>(() => ServerFailure(), instanceName: 'server');
  sl.registerLazySingleton<Failure>(() => CacheFailure(), instanceName: 'cache');

  // Features - Meals
  sl.registerLazySingleton(() => MealDatasource(sl()));
  sl.registerLazySingleton(() => GetMealListUseCase(sl()));
  sl.registerLazySingleton(() => GetMealByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetMealListByCategoryUseCase(sl()));
  sl.registerLazySingleton(() => ListMealsByFirstLetterUseCase(sl()));
  sl.registerLazySingleton(() => LookupRandomMealUseCase(sl()));
  sl.registerLazySingleton(() => SearchMealsByNameUseCase(sl()));
  sl.registerLazySingleton(() => GetMealListByAreaUseCase(sl()));
  

  sl.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(sl()));

  sl.registerFactory(() => MealsBloc(
    getMealsUsecase: sl<GetMealListUseCase>(),
    getMealListByCategoryUseCase: sl<GetMealListByCategoryUseCase>(),
    getMealListByAreaUseCase: sl<GetMealListByAreaUseCase>(),
    lookupRandomMealUseCase: sl<LookupRandomMealUseCase>(),
  ));

  // Features - Categories
  sl.registerLazySingleton(() => CategoryDatasource(sl()));
  sl.registerLazySingleton(() => GetCategoryListUseCase(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerFactory(() => CategoriesBloc(getCategoriesUsecase: sl()));

  // Features - Meal Detail
  sl.registerLazySingleton(() => MealDetailDatasource(sl()));
  sl.registerLazySingleton<MealDetailRepository>(() => MealDetailRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => GetMealDetailUseCase(sl()));
  sl.registerLazySingleton(() => UpdateMealDetailUseCase(sl()));
  sl.registerFactory(() => MealDetailBloc(
    getMealDetailUseCase: sl(),
    updateMealDetailUseCase: sl(),
  ));

  // Features - Cart
  sl.registerFactory(() => CartBloc(cartBox: sl<Box<CartItem>>()));

  // Features - Favorites
  sl.registerFactory(() => FavoriteBloc(favoriteBox: sl<Box<MealDetailModel>>(), cartBox: sl<Box<CartItem>>()));
}
