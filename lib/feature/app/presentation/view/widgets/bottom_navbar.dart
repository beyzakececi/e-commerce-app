import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../product/constants/app_colors.dart';
import '../../../../../product/constants/app_icons.dart';
import '../../../../../product/enums/bottom_bar_items.dart';
import '../../../../../product/router/route_names.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  var currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      surfaceTintColor: AppColors.whiteColor,
      selectedIndex: currentIndex,
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.electricViolet.withOpacity(.2),
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.goNamed(AppRouteName.homeScreen.name);
            break;
          case 1:
            context.goNamed(AppRouteName.explore.name);
            break;
          case 2:
            context.goNamed(AppRouteName.myCart.name);
            break;
          case 3:
            context.goNamed(AppRouteName.favorites.name);
            break;
          case 4:
            context.goNamed(AppRouteName.account.name);
            break;
        }
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(AppIcons.kShopOutlinedIcon),
          label: BottomBarItems.shop.value,
        ),
        NavigationDestination(
          icon: const Icon(Icons.manage_search_rounded, size: 35),
          label: BottomBarItems.explore.value,
        ),
        NavigationDestination(
          icon: const Icon(AppIcons.kCartIcon),
          label: BottomBarItems.cart.value,
        ),
        NavigationDestination(
          icon: const Icon(Icons.favorite_border),
          label: BottomBarItems.favourite.value,
        ),
        NavigationDestination(
          icon: const Icon(AppIcons.kUserFilledIcon),
          label: BottomBarItems.account.value,
        ),
      ],
    );
  }

}
