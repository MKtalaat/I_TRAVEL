import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_dropdown.dart';
import 'package:i_travel/core/widgets/custom_text_field.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateUserDataBottomSheet extends StatefulWidget {
  const UpdateUserDataBottomSheet({super.key});

  @override
  State<UpdateUserDataBottomSheet> createState() =>
      _UpdateUserDataBottomSheetState();
}

class _UpdateUserDataBottomSheetState extends State<UpdateUserDataBottomSheet> {
  @override
  void initState() {
    ProfileCubit.get(context).firstNameController.text =
        ProfileCubit.get(context).authenticationModel.firstName;
    ProfileCubit.get(context).lastNameController.text =
        ProfileCubit.get(context).authenticationModel.lastName;
    ProfileCubit.get(context).genderDropdownValue =
        ProfileCubit.get(context).authenticationModel.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          Navigator.pop(context);
        } else if (state is UpdateUserDataFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateUserDataLoadingState,
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
                    AppStrings.updateProfile,
                    style: AppStyles.styleBold18White.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(AppConstants.size10h),
                  CustomTextField(
                    textInputType: TextInputType.name,
                    controller: ProfileCubit.get(context).firstNameController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    title: AppStrings.firstName,
                    hintText: AppStrings.enterFirstName,
                  ),
                  CustomTextField(
                    textInputType: TextInputType.name,
                    controller: ProfileCubit.get(context).lastNameController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    title: AppStrings.lastName,
                    hintText: AppStrings.enterLastName,
                  ),
                  CustomDropdown(
                    title: AppStrings.gender,
                    hintText: AppStrings.selectGender,
                    messageForValidate: AppStrings.pleaseSelectGender,
                    items: ['Male', 'Female']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChange: (value) {
                      ProfileCubit.get(context).genderDropdownValue = value;
                    },
                  ),
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
                          if (ProfileCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            ProfileCubit.get(context).updateUserData().then(
                                  (value) {
                                ProfileCubit.get(context).getUserData();
                              },
                            );
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
