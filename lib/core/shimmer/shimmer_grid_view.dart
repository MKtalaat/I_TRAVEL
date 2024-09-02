import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/shimmer/shimmer_container_effect.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';

class ShimmerTripsGridView extends StatelessWidget {
  const ShimmerTripsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppConstants.size15h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainerEffect(
                  width: 60.w,
                ),
                ShimmerContainerEffect(
                  width: 40.w,
                ),
              ],
            ),
          ),
          StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: AppConstants.size10w,
              mainAxisSpacing: AppConstants.size10w,
              itemCount:4,
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.4 : 1.2);
              },
              itemBuilder: (context, index) {
                return  Container(
                  padding: EdgeInsets.all(AppConstants.size8h),
                  decoration: BoxDecoration(
                    color: AppColors.grey50,
                    borderRadius: BorderRadius.circular(AppConstants.radius10r),
                  ),
                  child:  Column(
                    children: [
                      const Expanded(
                        child: ShimmerContainerEffect(),
                      ),
                      Gap(AppConstants.size10h),
                      const ShimmerContainerEffect(),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical:AppConstants.size4h),
                        child: const  Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child:  ShimmerContainerEffect()),
                            Expanded(
                                child: SizedBox.shrink())
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Expanded(

                              child: ShimmerContainerEffect()),
                          Expanded(
                              child: SizedBox.shrink())
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
