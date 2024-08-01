import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/input_decoration_theme.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'InterFontFamily',
  primaryColor: AppColors.electricViolet,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.whiteColor,
  inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
  elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
);