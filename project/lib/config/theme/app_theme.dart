import 'package:flutter/material.dart';
import 'package:random_qoutes/core/utils/app_colors.dart';
import 'package:random_qoutes/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    // APPBAR
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75),
          bottomRight: Radius.circular(75),
        ),
      ),
      toolbarHeight: 100,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),

    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: AppColors.background,

    // TEXT
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.secondary),
      titleMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
