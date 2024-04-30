import 'package:cooszy_pre/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: AppColors.backgroundLightColor,
      primary: AppColors.primaryLightColor,
      secondary: AppColors.psecondaryLightColor,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.backgroundDarkColor,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.psecondaryDarkColor,
    ));
