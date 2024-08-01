import 'package:e_commerce/features/data/models/meal_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/router/go_router.dart';
import 'package:e_commerce/core/theme/light_theme.dart';
import 'package:e_commerce/features/presentation/viewmodel/home/home_viewmodel_imp.dart';
import 'package:e_commerce/features/presentation/viewmodel/base_app/base_app_viewmodel.dart';
import 'package:e_commerce/features/presentation/viewmodel/base_app/base_app_viewmodel_imp.dart';
import 'package:e_commerce/features/presentation/viewmodel/cart/cart_viewmodel.dart';
import 'package:e_commerce/features/presentation/viewmodel/home/home_viewmodel.dart';
import 'package:e_commerce/features/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:e_commerce/features/presentation/viewmodel/splash/splash_viewmodel_imp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(MealSummaryModelAdapter());
  await Hive.openBox<MealSummaryModel>('favorites');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: lightTheme,
        routerConfig: AppRoutes.instance.router,
      ),
    );
  }
}

final splashViewModelImp = ChangeNotifierProvider<SplashViewModel>((ref) => SplashViewModelImp());
final baseAppViewModelImp = ChangeNotifierProvider<BaseAppViewModel>((ref) => BaseAppViewModelImp());
final homeViewModelImp = ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModelImp());
final cartViewModelProvider = ChangeNotifierProvider<CartViewModel>((ref) {
  return CartViewModel();
});
