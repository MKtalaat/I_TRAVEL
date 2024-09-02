import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';

class NameAndEmailUserProfile extends StatelessWidget {
  const NameAndEmailUserProfile(
      {super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppConstants.size10h),
          child: Text(
            name,
            style: AppStyles.styleRegular18White.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Text(
          email,
          style: AppStyles.styleRegular15Grey,
        ),
      ],
    );
  }
}
