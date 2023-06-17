import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';
import 'package:ramadan_app/core/init/theme/custom_text_theme.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
  systemTheme
}

class CustomTheme {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      hoverColor: AppColors.secondaryColor,
      primaryColor: AppColors.primaryColor,
      textTheme: CustomTextTheme.textTheme.apply(
        displayColor: AppColors.secondaryColor,
        bodyColor: AppColors.secondaryColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: AppColors.secondaryColor,
      cardColor: AppColors.cardColor,
      brightness: Brightness.light,
    ),
    AppTheme.darkTheme: ThemeData(
      hoverColor: const Color(0xFF6B778D),
      primaryColor: AppColors.primaryColor,
      textTheme: CustomTextTheme.textTheme.apply(
        displayColor: AppColors.darkSecondaryColor,
        bodyColor: AppColors.darkSecondaryColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      secondaryHeaderColor: AppColors.darkSecondaryColor,
      cardColor: AppColors.darkCardColor,
      brightness: Brightness.dark,
    ),
  };
}
