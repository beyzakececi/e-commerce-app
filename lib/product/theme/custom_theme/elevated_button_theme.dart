import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../enums/app_size.dart';


class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Light
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.electricViolet,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.custom.value)),
    ),
  );

/// Dark
}