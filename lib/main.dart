import 'package:e_commerce/product/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'feature/home/presentation/bloc/meals_bloc.dart';
import 'product/constants/app_constants.dart';
import 'product/router/go_router.dart';
import 'product/theme/light_theme.dart';

void main() async {
  // Ensure that the Flutter binding has been initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  init();

  // Run app
  runApp(
    MultiBlocProvider(
      providers: [
        //BlocProvider(
          //create: (context) => sl<CategoriesBloc>()..add(FetchCategories()),
        //),
        BlocProvider(
          create: (context) => sl<MealsBloc>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //theme: sl<AppTheme>().lightTheme,
      //darkTheme: sl<AppTheme>().darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRoutes.instance.router,
    );
  }
}



