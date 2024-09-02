import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_text_button.dart';

class TitleListAndViewAll extends StatelessWidget {
  const TitleListAndViewAll(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:
            MediaQuery.sizeOf(context).width > 780 ? AppConstants.size5h : 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.styleBold18White.copyWith(
              color: AppColors.black,
            ),
          ),
          CustomTextButton(
            onPressed: onPressed,
            title: AppStrings.viewAll,
          ),
        ],
      ),
    );
  }
}
