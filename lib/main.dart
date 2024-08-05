import 'package:e_commerce/product/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'feature/cart/presentation/bloc/cart_bloc.dart';
import 'feature/explore/presentation/bloc/categories_bloc.dart';
import 'feature/favorites/presentation/bloc/favorite_bloc.dart';
import 'feature/home/presentation/bloc/meals_bloc.dart';
import 'product/router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => sl<CategoriesBloc>()..add(FetchCategories()),
        ),
        BlocProvider(
          create: (context) => sl<MealsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(LoadCart()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerConfig: AppRoutes.instance.router,
      ),
    );
  }
}
