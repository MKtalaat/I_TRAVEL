import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/core/shimmer/shimmer_container_effect.dart';
import 'package:i_travel/core/utils/app_constants.dart';

class ShimmerProfileItem extends StatelessWidget {
  const ShimmerProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConstants.size10h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.size10h,
              bottom: AppConstants.size15h,
            ),
            child: ShimmerContainerEffect(
              height: 35.h,
            ),
          ),
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.size10h,
              bottom: AppConstants.size15h,
            ),
            child: ShimmerContainerEffect(
              height: 35.h,
            ),
          ),
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.size10h,
              bottom: AppConstants.size15h,
            ),
            child: ShimmerContainerEffect(
              height: 35.h,
            ),
          ),
        ],
      ),
    );
  }
}