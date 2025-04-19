import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Share',
      theme: ThemeData(
        primaryColor: AppColors.darkBrown,
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkBrown,
        ),
        chipTheme: ChipThemeData(
          selectedColor: AppColors.orange,
          backgroundColor: AppColors.cream,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
        ),
      ),
      home: HomeScreen(),
    );
  }
}