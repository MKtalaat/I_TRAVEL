import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/functions/show_custom_bottom_sheet.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/update_user_data_bottom_sheet.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.size10h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleRegular16Black.copyWith(
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: AppConstants.size5h,
          ),
          Container(
            padding: EdgeInsets.all(AppConstants.size5h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            //height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.styleRegular16Black.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showCustomBottomSheet(
                      context: context,
                      content: const UpdateUserDataBottomSheet(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius5r),
                      color: Colors.white,
                    ),
                    width: 28.h,
                    height: 28.h,
                    child: Icon(
                      IconBroken.Edit,
                      color: AppColors.primary,
                      size: MediaQuery.sizeOf(context).width>780?AppConstants.iconSize20:AppConstants.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
