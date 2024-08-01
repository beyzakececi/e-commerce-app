import 'package:e_commerce/core/database/hive_keys.dart';
import '../../domain/repostories/splash_repository.dart';
import '../datasources/local_datasources/local_datasource.dart';


class SplashRepositoryImp implements SplashRepository {
  final LocalDataSource localDataSource;

  SplashRepositoryImp({required this.localDataSource});

  @override
  Future<bool?> getInitialScreen() async {
    //return await localDataSource.getBool(HiveKeys.firstOpen.name);
  }

  @override
  Future<void> setInitialScreen() async {
    //await localDataSource.saveBool(HiveKeys.firstOpen.name, true);
  }
}