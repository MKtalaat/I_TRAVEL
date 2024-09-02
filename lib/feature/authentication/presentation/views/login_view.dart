import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/background_image.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imagePath: AppAssets.backgroundImage,
        ),
        const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          body: AnnotatedRegion(
            value: AppConstants.systemUiOverlayStyleDark,
            child: LoginViewBody(),
          ),
        ),
      ],
    );
  }
}
