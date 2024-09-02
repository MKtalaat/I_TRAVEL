import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';

void showCustomBottomSheet(
    {required BuildContext context, required Widget content}) {
  showModalBottomSheet(
    backgroundColor: AppColors.transparent,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.radius25r),
        topRight: Radius.circular(AppConstants.radius25r),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) {
      return content;
    },
  );
}
