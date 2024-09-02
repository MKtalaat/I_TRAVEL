import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/user_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppConstants.defaultPadding,
        left: AppConstants.defaultPadding,
        top: AppConstants.size25h,
      ),
      child: Row(
        children: [
          BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
            builder: (context, state) {
              return InkWell(
                child: AnimatedDrawerCubit.get(context).isOpenDrawer
                    ? Icon(
                        IconBroken.Arrow___Left_2,
                        size: MediaQuery.sizeOf(context).width > 780
                            ? AppConstants.iconSize24
                            : AppConstants.iconSize33,
                        color: AppColors.primary,
                      )
                    : Icon(
                        IconBroken.Filter,
                        size: MediaQuery.sizeOf(context).width > 780
                            ? AppConstants.iconSize24
                            : AppConstants.iconSize33,
                        color: AppColors.primary,
                      ),
                onTap: () {
                  AnimatedDrawerCubit.get(context).isOpenDrawer
                      ? AnimatedDrawerCubit.get(context).closeDrawer()
                      : MediaQuery.sizeOf(context).width > 780
                          ? AnimatedDrawerCubit.get(context)
                              .openDrawerForTablet()
                          : AnimatedDrawerCubit.get(context)
                              .openDrawerForMobil();
                },
              );
            },
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              text: 'i',
              style: AppStyles.styleRegular25Black.copyWith(
                color: AppColors.redAccent,
              ),
              children: [
                TextSpan(
                  style: AppStyles.styleRegular25Black.copyWith(
                    color: AppColors.primary,
                  ),
                  text: 'Travel',
                ),
              ],
            ),
          ),
          const Spacer(),
          const UserImage()
        ],
      ),
    );
  }
}
