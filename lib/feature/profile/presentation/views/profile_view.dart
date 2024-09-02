import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/background_image.dart';
import 'package:i_travel/core/widgets/custom_back_button.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          imagePath: AppAssets.backgroundImage,
        ),
        Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            backgroundColor: AppColors.transparent,
            title: const Text(AppStrings.profile),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          body: const AnnotatedRegion(
            value: AppConstants.systemUiOverlayStyleDark,
            child: ProfileViewBody(),
          ),
        )
      ],
    );
  }
}
