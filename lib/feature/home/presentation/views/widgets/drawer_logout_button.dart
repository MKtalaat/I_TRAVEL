import 'package:flutter/material.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';

class DrawerLogoutButton extends StatelessWidget {
  const DrawerLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CacheHelper.removeData(key: 'userId').then((value) {
          AnimatedDrawerCubit.get(context).closeDrawer();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginView, (route) => false);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconBroken.Logout,
            color: Colors.white,
            size: AppConstants.iconSize28,
          ),
          SizedBox(
            width: AppConstants.size10w,
          ),
          Text(
            'Logout',
            style: AppStyles.styleRegular15Grey.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
