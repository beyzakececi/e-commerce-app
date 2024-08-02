import 'package:e_commerce/product/constants/app_constants.dart';
import 'package:e_commerce/product/router/go_router.dart';
import 'package:e_commerce/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:e_commerce/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:e_commerce/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'feature/explore/presentation/viewmodel/category_meals_viewmodel.dart';
import 'feature/product_detail/data/model/meal_summary_model.dart';
import 'feature/splash/viewmodel/splash_viewmodel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(MealSummaryModelAdapter());
  await Hive.openBox<MealSummaryModel>('favorites');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: lightTheme,
      routerConfig: AppRoutes.instance.router,
    );
  }
}


final cartViewModelProvider = ChangeNotifierProvider<CartViewModel>((ref) {
  return CartViewModel();
});

