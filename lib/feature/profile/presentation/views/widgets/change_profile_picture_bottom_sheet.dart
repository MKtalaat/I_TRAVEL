import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:i_travel/feature/profile/presentation/views/widgets/image_user_for_bottom_sheet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangeProfilePictureBottomSheet extends StatelessWidget {
  const ChangeProfilePictureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UploadImageSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          Navigator.pop(context);
        } else if (state is UploadImageFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UploadImageLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: AppConstants.size15h,
            ),
            color: AppColors.white,
            child: Form(
              key: ProfileCubit.get(context).formKey,
              child: Column(
                children: [
                  Text(
                    AppStrings.updateProfilePicture,
                    style: AppStyles.styleBold18White.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(AppConstants.size15h),
                  const ImageUserForBottomSheet(),
                 const Spacer(),
                  GradientButton(
                    title: Text(
                      AppStrings.update,
                      style: AppStyles.styleRegular18White,
                    ),
                    onPressed: () {
                      InternetConnectionCubit.get(context)
                          .checkInternetConnection()
                          .then((value) {
                        if (InternetConnectionCubit.get(context).isInternet) {
                          if (ProfileCubit.get(context).image != null) {
                            ProfileCubit.get(context).uploadUserImage().then((value){
                              ProfileCubit.get(context).getUserData();
                            });
                          }else{
                            showErrorSnackBar(
                                context: context,
                                message: 'Please select your picture');
                          }
                        }else{
                          showErrorSnackBar(
                              context: context,
                              message: AppStrings.noInternetTitle);
                        }
                      });

                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
