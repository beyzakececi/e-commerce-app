
import 'package:hive_flutter/hive_flutter.dart' as hive;

import 'package:get_it/get_it.dart';

import '../features/data/datasources/local_datasources/local_datasource.dart';
import '../features/data/datasources/local_datasources/local_datasource_imp.dart';
import '../features/data/repositories/splash_repository_imp.dart';
import '../features/domain/repostories/splash_repository.dart';
import '../features/domain/usecases/splash_usecase.dart';

GetIt injector = GetIt.instance;

reset() {
  injector.reset();
}

void initializeDependencies() async {
  // hive
  injector.registerLazySingleton(() => hive.Hive.box('settingsBox'));

  // local
  injector.registerLazySingleton<LocalDataSource>(() =>
      LocalDataSourceImp(box: injector()));

  //repository
  injector.registerLazySingleton<SplashRepository>(() =>
      SplashRepositoryImp(
        localDataSource: injector(),
      ));

  //injector.registerLazySingleton<AuthRepository>(() => ShopRepositoryImp(remoteDataSource: injector()));
  //injector.registerLazySingleton<ProfileRepository>(() => AccountRepositoryImp(remoteDataSource: injector()));
  //injector.registerLazySingleton<AddressRepository>(() => CartRepositoryImp(remoteDataSource: injector()));


  //usecase
  injector.registerLazySingleton<GetInitialScreen>(() =>
      GetInitialScreen(splashRepository: injector()));


}