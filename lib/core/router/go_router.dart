import 'package:e_commerce/core/router/route_names.dart';
import 'package:e_commerce/features/presentation/view/explore/explore_screen.dart';
import 'package:e_commerce/features/presentation/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/domain/entities/meal/meal.dart';
import '../../features/presentation/view/account/account_screen.dart';
import '../../features/presentation/view/app/screens/app.dart';
import '../../features/presentation/view/cart/cart_screen.dart';
import '../../features/presentation/view/category_meals/meal_detail/meal_detail_screen.dart';
import '../../features/presentation/view/favorites/favorites_screen.dart';
import '../../features/presentation/view/orderAccept/order_accepted_screen.dart';
import '../../features/presentation/view/splash/onboard.dart';
import '../../features/presentation/view/splash/splash_screen.dart';

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
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: AppRouteName.onbording.name,
        path: AppRouteName.onbording.path,
        builder: (context, state) => const OnboardView(),
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
              return FavoritesView();
            },
          ),
          GoRoute(
            path: AppRouteName.productDetail.path,
            name: AppRouteName.productDetail.name,
            builder: (context, state) {
              final meal = state.extra as Meal;
              return MealDetailScreen(mealId: meal.idMeal);
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
