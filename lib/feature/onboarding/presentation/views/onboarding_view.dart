import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/background_image.dart';
import 'package:i_travel/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imagePath: AppAssets.splashImage,
        ),
        const Scaffold(
          backgroundColor: AppColors.transparent,
          resizeToAvoidBottomInset: false,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppConstants.systemUiOverlayStyleDark,
            child: OnBoardingViewBody(),
          ),
        )
      ],
    );
  }
}
