import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/router/route_names.dart';
import '../../../../../main.dart';
import '../../../viewmodel/base_app/base_app_viewmodel.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(baseAppViewModelImp);
    return NavigationBar(
      surfaceTintColor: AppColors.whiteColor,
      selectedIndex: _calculateSelectedIndex(context),
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.electricViolet.withOpacity(.2),
      onDestinationSelected: (value) => _onItemTapped(context, viewModel, value),
      destinations: viewModel.views,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRouteName.homeScreen.path)) {
      return 0;
    }
    if (location.startsWith(AppRouteName.explore.path)) {
      return 1;
    }
    if (location.startsWith(AppRouteName.myCart.path)) {
      return 2;
    }
    if (location.startsWith(AppRouteName.favorites.path)) {
      return 3;
    }
    if (location.startsWith(AppRouteName.account.path)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(
    BuildContext context,
    BaseAppViewModel viewModel,
    int index,
  ) {
    viewModel.selectedIndex = index;
    switch (index) {
      case 0:
        context.goNamed(AppRouteName.homeScreen.name);
      case 1:
        context.goNamed(AppRouteName.explore.name);
      case 2:
        context.goNamed(AppRouteName.myCart.name);
      case 3:
        context.goNamed(AppRouteName.favorites.name);
      case 4:
        context.goNamed(AppRouteName.account.name);
    }
  }
}
