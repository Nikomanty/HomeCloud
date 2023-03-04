import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';

abstract class AppThemeData {
  static ThemeData getThemeData() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.primaryVariant,
        appBarTheme: AppBarTheme(
          color: AppColors.primary,
          titleTextStyle: GoogleFonts.robotoCondensed(
              textStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.onPrimary,
          )),
        ),
        iconTheme: const IconThemeData(color: AppColors.onPrimary),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.secondary),
        )),
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.primaryVariant,
        ),
        textTheme: GoogleFonts.robotoCondensedTextTheme(const TextTheme(
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
