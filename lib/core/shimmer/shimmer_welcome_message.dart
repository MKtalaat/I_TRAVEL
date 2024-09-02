import 'package:flutter/material.dart';
import 'package:i_travel/core/shimmer/shimmer_container_effect.dart';
import 'package:i_travel/core/utils/app_constants.dart';

class ShimmerWelcomeMessage extends StatelessWidget {
  const ShimmerWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal:AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.width/2,
            height: AppConstants.size20h,
          ),
          ShimmerContainerEffect(
            margin: EdgeInsets.only(top: AppConstants.size8h),
            width: MediaQuery.of(context).size.width/1.4,
            height: AppConstants.size10h,
          ),
        ],
      ),
    );
  }
}
