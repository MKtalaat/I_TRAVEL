import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_travel/core/animations/fade_transition_animation.dart';
import 'package:i_travel/core/animations/slide_transition_animation.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: AppConstants.size20h),
        child: SlideTransitionAnimation(
          duration: const Duration(seconds: 2),
          begin: const Offset(0, 0.1),
          end: Offset.zero,
          child: FadeTransitionAnimation(
            duration: const Duration(seconds: 3),
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: OnBoardingCubit.get(context).pageController,
              itemCount: OnBoardingCubit.get(context).boarding.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Center(
                          child: SvgPicture.asset(
                        OnBoardingCubit.get(context).boarding[index].image,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppConstants.size30h,
                        bottom: AppConstants.size10h,
                      ),
                      child: Text(
                        OnBoardingCubit.get(context).boarding[index].title,
                        style: AppStyles.styleBold22White,
                      ),
                    ),
                    Text(
                      OnBoardingCubit.get(context).boarding[index].body,
                      style: AppStyles.styleRegular16Black.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (int index) {
                OnBoardingCubit.get(context).onChangePageView(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
