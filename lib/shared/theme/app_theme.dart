import 'package:all_events/shared/theme/app_colors.dart';
import 'package:all_events/shared/theme/app_font_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      iconTheme: const IconThemeData(color: AppColors.redColor),
      appBarTheme: AppBarTheme(
        titleTextStyle: AppCss.interBold18,
        backgroundColor: AppColors.darkbgColor,
        surfaceTintColor: AppColors.darkbgColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      scaffoldBackgroundColor: AppColors.darkbgColor,
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2)))),
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.whiteColor,
      primaryColorLight: AppColors.primaryColorLight,
      colorScheme: const ColorScheme.light().copyWith(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        primaryContainer: AppColors.whiteColor,
        secondary: const Color(0xFF323444),
        surface: AppColors.whiteColor,
        onSurface: const Color(0xFFAFB0B6),
        onError: const Color(0xFFAFB0B6),
        onPrimary: AppColors.blackColor,
        onSecondary: AppColors.darkbgColor,
        secondaryContainer: const Color(0xFF001928),
        error: const Color(0xFFFE3232),
      ),
    );
  }
}
