import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/background_image.dart';
import 'package:i_travel/feature/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToOnBoardingView();
    super.initState();
  }

  void navigateToOnBoardingView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (CacheHelper.getBoolean(key: 'onBoarding') ?? false) {
        if (AppConstants.userId.isNotEmpty) {
          return Navigator.pushReplacementNamed(context, Routes.layoutView);
        } else {
          return Navigator.pushReplacementNamed(context, Routes.loginView);
        }
      } else {
        return Navigator.pushReplacementNamed(context, Routes.onBoardingView);
      }
    });
  }

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
            child: SplashViewBody(),
          ),
        ),
      ],
    );
  }
}
