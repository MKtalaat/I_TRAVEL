import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/feature/plan/data/models/plan_model.dart';

class PlanListViewItem extends StatelessWidget {
  const PlanListViewItem({super.key, required this.plan});

  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(AppConstants.size10h),
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(AppConstants.radius8r),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CustomNetworkImage(
              image: plan.image,
            ),
          ),
          SizedBox(
            width: AppConstants.size5w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.styleBold16Black,
                ),
                Row(
                  children: [
                    Icon(
                      IconBroken.Location,
                      color: AppColors.redAccent,
                      size: AppConstants.iconSize18,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        plan.address,
                        style: AppStyles.styleRegular15Grey.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconBroken.Calendar,
                          color: AppColors.primary,
                          size: AppConstants.iconSize18,
                        ),
                        Text(
                          plan.date,
                          style: AppStyles.styleRegular15Grey.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${plan.price} EGP',
                      style: AppStyles.styleRegular15Grey.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
