import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/drawer_buttons_section.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/drawer_logout_button.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/drawer_user_data.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: AppConstants.size45h,
          bottom: AppConstants.size45h,
          left: AppConstants.size15h,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerUserData(),
            DrawerButtonsSection(),
            DrawerLogoutButton(),
          ],
        ),
      ),
    );
  }
}
