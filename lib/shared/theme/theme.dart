// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/index.dart';
import '../extensions/index.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.WHITE,
    useMaterial3: true,
    primaryColor: AppColors.PAUA,
    colorScheme: const ColorScheme.light(
      primary: AppColors.PAUA,
      onPrimary: Colors.white,
      surface: AppColors.WHITE,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.PAUA,
      selectionColor: AppColors.PAUA,
      selectionHandleColor: AppColors.PAUA,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.WHITE,
      foregroundColor: AppColors.WHITE,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w600,
        color: AppColors.BLACK,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.WHITE,
      filled: true,
      errorMaxLines: 2,
      hintStyle: TextStyle(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        color: AppColors.BLACK_PANTHER,
      ),
      errorStyle: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w500,
        color: AppColors.LOBSTER,
      ),
      labelStyle: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w500,
        color: AppColors.BLACK_PANTHER,
      ),
      contentPadding: 20.padHorizontal + 17.padVertical,
      border: OutlineInputBorder(
        borderRadius: 15.radiusAll,
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.BLACK_PANTHER,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: 12.radiusAll,
        borderSide: const BorderSide(
          color: AppColors.BLACK_PANTHER,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: 12.radiusAll,
        borderSide: const BorderSide(
          color: AppColors.BLACK_PANTHER,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: 12.radiusAll,
        borderSide: const BorderSide(
          color: AppColors.BLACK_PANTHER,
          width: 1,
        ),
      ),
    ),
    textTheme: TextTheme(
      // headlineLarge: TextStyle(
      //   fontSize: 44.sp,
      //   color: AppColors.WHITE,
      //   fontWeight: FontWeight.w700,
      // ),
      // headlineSmall: TextStyle(
      //   fontSize: 18.sp,
      //   fontWeight: FontWeight.w400,
      //   color: AppColors.WHITE,
      // ),
      // titleLarge: TextStyle(
      //   fontSize: 24.sp,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.BLACK,
      // ),
      // titleMedium: TextStyle(
      //   color: AppColors.BLACK,
      //   fontSize: 16.sp,
      //   fontFamily: AppFonts.semiBold,
      // ),
      // titleSmall: TextStyle(
      //   fontSize: 14.sp,
      //   fontFamily: AppFonts.bold,
      //   color: AppColors.BABY_TALK_GREY,
      // ),
      // labelLarge: TextStyle(
      //   fontSize: 18.sp,
      //   fontFamily: AppFonts.bold,
      //   color: AppColors.NIGHT_SKY,
      // ),
      labelMedium: TextStyle(
        fontSize: 16.spMin,
        fontWeight: FontWeight.w500,
        color: AppColors.WHITE,
      ),
      labelSmall: TextStyle(
        fontSize: 12.spMin,
        fontWeight: FontWeight.w400,
        color: AppColors.WHITE,
      ),
      // bodySmall: TextStyle(
      //   fontSize: 12.sp,
      //   fontFamily: AppFonts.regular,
      //   color: AppColors.BABY_TALK_GREY,
      // ),
      // displayLarge: TextStyle(
      //   color: AppColors.BLACK,
      //   fontFamily: AppFonts.medium,
      //   fontSize: 13.sp,
      // ),
      // displayMedium: TextStyle(
      //   fontSize: 12.sp,
      //   fontFamily: AppFonts.semiBold,
      //   color: AppColors.BLEUCHATEL_BLUE,
      // ),
      // displaySmall: TextStyle(
      //   fontSize: 8.sp,
      //   fontFamily: AppFonts.regular,
      //   color: AppColors.WHITE,
      // ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: AppColors.PAUA,
      colorScheme: const ColorScheme.dark(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.PAUA,
        selectionColor: AppColors.PAUA,
        selectionHandleColor: AppColors.PAUA,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.BLACK12,
        foregroundColor: AppColors.BLACK12,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w600,
          color: AppColors.BLACK,
        ),
      ),
      textTheme: TextTheme(
        // headlineLarge: TextStyle(
        //   fontSize: 44.sp,
        //   color: AppColors.WHITE,
        //   fontWeight: FontWeight.w700,
        // ),
        // headlineSmall: TextStyle(
        //   fontSize: 18.sp,
        //   fontWeight: FontWeight.w400,
        //   color: AppColors.WHITE,
        // ),
        // titleLarge: TextStyle(
        //   fontSize: 24.sp,
        //   fontWeight: FontWeight.w700,
        //   color: AppColors.BLACK,
        // ),
        // titleMedium: TextStyle(
        //   color: AppColors.BLACK,
        //   fontSize: 16.sp,
        //   fontFamily: AppFonts.semiBold,
        // ),
        // titleSmall: TextStyle(
        //   fontSize: 14.sp,
        //   fontFamily: AppFonts.bold,
        //   color: AppColors.BABY_TALK_GREY,
        // ),
        // labelLarge: TextStyle(
        //   fontSize: 18.sp,
        //   fontFamily: AppFonts.bold,
        //   color: AppColors.NIGHT_SKY,
        // ),
        labelMedium: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w500,
          color: AppColors.BLACK12,
        ),
        labelSmall: TextStyle(
          fontSize: 12.spMin,
          fontWeight: FontWeight.w400,
          color: AppColors.BLACK12,
        ),
        // bodySmall: TextStyle(
        //   fontSize: 12.sp,
        //   fontFamily: AppFonts.regular,
        //   color: AppColors.BABY_TALK_GREY,
        // ),
        // displayLarge: TextStyle(
        //   color: AppColors.BLACK,
        //   fontFamily: AppFonts.medium,
        //   fontSize: 13.sp,
        // ),
        // displayMedium: TextStyle(
        //   fontSize: 12.sp,
        //   fontFamily: AppFonts.semiBold,
        //   color: AppColors.BLEUCHATEL_BLUE,
        // ),
        // displaySmall: TextStyle(
        //   fontSize: 8.sp,
        //   fontFamily: AppFonts.regular,
        //   color: AppColors.WHITE,
        // ),
      ));
}
