import 'package:flutter/material.dart';
import 'custom_colors.dart';

class AppTheme {
  
  ThemeData getTheme() {
    return ThemeData( 
      colorScheme: ColorScheme.fromSeed(
        seedColor: CustomColors.primary,
        primary: CustomColors.primary,
        secondary: CustomColors.secondary,
        tertiary: CustomColors.tertiary,
        surface: CustomColors.background,
      ),
      cardTheme: const CardTheme(
        color: CustomColors.cardBackground
      ),
      cardColor: CustomColors.cardBackground,
      useMaterial3: true,
    );
  }
}