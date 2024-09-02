import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/core/utils/app_colors.dart';

abstract class AppStyles {
  static final styleRegular13Grey = TextStyle(
    fontSize: 11.sp,
    color: AppColors.grey,
  );
  static final styleRegular14Grey = TextStyle(
    fontSize: 12.sp,
    color: AppColors.grey,
  );
  static final styleSemiBold14Grey = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );
  static final styleRegular15Grey = TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey,
  );
  static final styleRegular16Black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
      color: AppColors.black
  );
  static final styleSemiBold16Black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
      color: AppColors.black
  );
  static final styleSemiBold20Grey = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
      color: AppColors.grey
  );
  static final styleRegular18White = TextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static final styleBold16Black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static final styleBold18White = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static final styleBold20Primary = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static final styleRegular20White = TextStyle(
    fontSize: 18.sp,
    color: AppColors.white,
  );
  static final styleRegular22White = TextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
  );
  static final styleBold22White = TextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static final styleRegular25Black = TextStyle(
    fontSize: 23.sp,
    color: AppColors.black,
  );
  static final styleBold30Black = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
      color: AppColors.black
  );
  static final styleBold40White = TextStyle(
    fontSize: 38.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
