import 'package:e_commerce/feature/onboarding/view/onboarding_screen.dart';
import 'package:e_commerce/feature/product_detail/presentation/pages/meal_detail_page.dart';
import 'package:e_commerce/feature/splash/view/splash_screen.dart';
import 'package:e_commerce/feature/explore/presentation/view/explore_screen.dart';
import 'package:e_commerce/product/router/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../feature/account/view/account_screen.dart';
import '../../feature/app/presentation/view/app.dart';
import '../../feature/cart/presentation/view/cart_screen.dart';
import '../../feature/explore/domain/entities/category.dart';
import '../../feature/explore/presentation/view/category_meals/category_meals_screen.dart';
import '../../feature/favorites/presentation/view/favorites_screen.dart';
import '../../feature/cart/presentation/view/order_accepted_screen.dart';
import '../../feature/home/domain/entities/meal_entity.dart';
import '../../feature/home/presentation/pages/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _instance;

  static AppRoutes get instance => _instance ??= AppRoutes._();

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouteName.splash.path,
    routes: [
      GoRoute(
        name: AppRouteName.splash.name,
        path: AppRouteName.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRouteName.onbording.name,
        path: AppRouteName.onbording.path,
        builder: (context, state) => const OnboardScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return App(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouteName.homeScreen.path,
            name: AppRouteName.homeScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              return  HomeView();
            },
          ),
          //explore screen
          GoRoute(
                path: AppRouteName.explore.path,
                name: AppRouteName.explore.name,
                builder: (context, state) {
              return  ExplorePage();
                }),
          GoRoute(
            path: '/category-meals',
            builder: (context, state) {
              final category = state.extra as CategoryEntity?;
              if (category == null) {
                return Scaffold(body: Center(child: Text('Invalid category data')));
              }
              return CategoryMealsScreen(category: category);
            },
          ),
          GoRoute(
            path: AppRouteName.mealDetail.path,
            name: AppRouteName.mealDetail.name,
            builder: (context, state) {
              final meal = state.extra as MealEntity?;
              if (meal == null) {
                return Scaffold(body: Center(child: Text('Invalid meal data')));
              }
              return MealDetailScreen(mealId: meal.id);
            },
          ),
          //cart screen
          GoRoute(
            path: AppRouteName.myCart.path,
            name: AppRouteName.myCart.name,
            builder: (context, state) {
              return  CartPage();
            },
          ),
          // Order Accepted screen
          GoRoute(
            path: AppRouteName.orderAccepted.path,
            name: AppRouteName.orderAccepted.name,
            builder: (context, state) {
              return OrderAcceptedView();
            },
          ),
          GoRoute(
            path: AppRouteName.favorites.path,
            name: AppRouteName.favorites.name,
            builder: (context, state) {
              return FavoritePage();
            },
          ),

          GoRoute(
            path: AppRouteName.account.path,
            name: AppRouteName.account.name,
            builder: (context, state) {
              return AccountView();
            },
          ),



        ],
      ),
    ],
  );
}
