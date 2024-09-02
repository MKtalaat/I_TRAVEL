import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/shimmer/shimmer_profile_view.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/name_and_email_user_profile.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/profile_item_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState ||
            state is SelectImageFromGalleryState) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
                top: AppConstants.defaultPadding,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageUserProfile(
                      image:
                          ProfileCubit.get(context).authenticationModel.image),
                  NameAndEmailUserProfile(
                    name:
                        '${ProfileCubit.get(context).authenticationModel.firstName} ${ProfileCubit.get(context).authenticationModel.lastName}',
                    email: ProfileCubit.get(context).authenticationModel.email,
                  ),
                  ProfileItemWidget(
                    title: AppStrings.firstName,
                    content:
                        ProfileCubit.get(context).authenticationModel.firstName,
                  ),
                  ProfileItemWidget(
                    title: AppStrings.lastName,
                    content:
                        ProfileCubit.get(context).authenticationModel.lastName,
                  ),
                  ProfileItemWidget(
                    title: AppStrings.gender,
                    content:
                        ProfileCubit.get(context).authenticationModel.gender,
                  ),
                  SizedBox(
                    height: AppConstants.size20h,
                  ),
                  GradientButton(
                    onPressed: () {
                      CacheHelper.removeData(key: 'userId').then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginView, (route) => false);
                      });
                    },
                    title: Text(
                      AppStrings.logout,
                      style: AppStyles.styleRegular16Black
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetUserDataFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerProfileView();
        }
      },
    );
  }
}
