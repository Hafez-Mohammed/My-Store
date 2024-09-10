import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData englishLightTheme = ThemeData(
      fontFamily: "Manrope",
      appBarTheme: const AppBarTheme(
        elevation: 1,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.onboardingMainColor,
        )
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.onboardingMainColor,
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: AppColors.onboardingMainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              height: 1.2,
              color: AppColors.onboardingBodyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.textFormFieldFocusedColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.blue)),
      ));
  static ThemeData arabicLightTheme = ThemeData(
      fontFamily: "Cairo",
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.onboardingMainColor,
        )
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: AppColors.onboardingMainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              height: 1.2,
              color: AppColors.onboardingBodyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.textFormFieldFocusedColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: Colors.blue)),
      ));
}
