import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_cloud/src/constants/app_colors.dart';

class AppThemeData {
  static ThemeData getThemeData() => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(color: AppColors.primary),
        scaffoldBackgroundColor: AppColors.primaryVariant,
        iconTheme: const IconThemeData(color: AppColors.onPrimary),
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.primaryVariant,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: AppColors.onPrimary,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: AppColors.onPrimary,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppColors.onPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: AppColors.onPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: AppColors.onPrimary,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: AppColors.onPrimary,
          ),
        )),
      );
}
