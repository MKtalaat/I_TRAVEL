import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';

class DrawerButtonsSectionItem extends StatelessWidget {
  const DrawerButtonsSectionItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
    this.iconSize,
  });

  final String title;
  final IconData icon;
  final double? iconSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.size20h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size:iconSize?? AppConstants.iconSize22,
              color: Colors.white,
            ),
            SizedBox(
              width: AppConstants.size10w,
            ),
            Text(
              title,
              style: AppStyles.styleRegular15Grey.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
