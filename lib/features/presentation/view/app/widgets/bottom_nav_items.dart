import 'package:flutter/material.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/enums/bottom_bar_items.dart';

class BottomNavItems {
  static final List<NavigationDestination> views = [
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
  ];
}
