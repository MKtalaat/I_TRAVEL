import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/register_texts_fields_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CacheHelper.setString(key: 'userId', value: state.user.uid);
          AppConstants.userId = state.user.uid;
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(
              context: context, message: 'logged in successfully!');
        } else if (state is RegisterFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
          color: Colors.white,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(AppConstants.size15h),
                      TitleAndSubtitle(
                        subtitle: AppStrings.signUpSubtitle,
                        title: AppStrings.signUp,
                        buttonTitle: AppStrings.signIn,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const RegisterTextsFieldsSection(),
                      GradientButton(
                        title: Text(
                          AppStrings.signUp,
                          style: AppStyles.styleRegular16Black
                              .copyWith(color: AppColors.white),
                        ),
                        onPressed: () {
                          if (RegisterCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            RegisterCubit.get(context).registerWithEmailAndPassword();
                          }
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
