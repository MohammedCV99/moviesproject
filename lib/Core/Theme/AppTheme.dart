import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';

class AppTheme {
  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.Black,
    iconTheme: IconThemeData(size: 14),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20,
      selectedItemColor: AppColors.MainColor,
      unselectedItemColor: AppColors.White,
      backgroundColor: AppColors.LightGrey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.MainColor),
        textStyle: WidgetStateProperty.all(
          TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}
