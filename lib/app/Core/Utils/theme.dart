import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // ===== LIGHT THEME =====
  static ThemeData lightTheme(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double scaleFont(double fontSize) => fontSize * width / 375;

    return ThemeData(
      scaffoldBackgroundColor: AppColors.fillColor,
      primaryColor: AppColors.primaryBlue,
      fontFamily: 'Cairo',

      // ✅ Text Styles
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: scaleFont(28),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: scaleFont(16),
          color: AppColors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: scaleFont(12),
          color: AppColors.white,
          
        ),
          bodySmall: TextStyle(
          fontSize: scaleFont(10),
           color: AppColors.white,
           fontWeight: FontWeight.w800,
         
          
        ),
        labelLarge: TextStyle(
          fontSize: scaleFont(18),
          color: AppColors.white,
           fontWeight: FontWeight.w800,
        ),
          labelMedium: TextStyle(
          fontSize: scaleFont(14),
          color: AppColors.white,
           fontWeight: FontWeight.w800,
        ),
        labelSmall: TextStyle(
          fontSize: scaleFont(11),
          color: AppColors.white,
           fontWeight: FontWeight.w800,
         
        ),
           titleLarge: TextStyle(
          fontSize: scaleFont(25),
           fontWeight: FontWeight.w900,
          color: AppColors.white,
        ),
        titleMedium: TextStyle(
          fontSize: scaleFont(16),
           fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
         titleSmall: TextStyle(
          fontSize: scaleFont(14),
           fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
      
      ),
    
        dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.containerColor), // 👈 menu bg
      surfaceTintColor: MaterialStatePropertyAll(Colors.transparent), // remove Material3 overlay
    
    ),
    
        ),
        
     

      // ✅ ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.black, // default background
          foregroundColor:AppColors.white, // text & icon color
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
