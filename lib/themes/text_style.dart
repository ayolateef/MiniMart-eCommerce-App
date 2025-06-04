import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';



class AppTextStyles {
  static final TextStyle categoryTitle = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle productName = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle productPrice = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle itemNameDetail = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle itemNames = TextStyle(
    fontFamily: 'IBMPlexMono',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final TextStyle aboutItem = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static final TextStyle buttonText = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final TextStyle addressText = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static final TextStyle navText = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle navSelectedText = TextStyle(
    fontFamily: 'IBMPlexSans',
    fontFamilyFallback: const ['Roboto', 'sans-serif'],
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}