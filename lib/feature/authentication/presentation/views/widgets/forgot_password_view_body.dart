import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/forgot_password_texts_fields_section.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          Navigator.pop(context);
        }
     },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgotPasswordLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                key: ForgotPasswordCubit.get(context).formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleAndSubtitle(
                      subtitle: AppStrings.resetPasswordSubtitle,
                      title: AppStrings.resetPassword,
                      buttonTitle: AppStrings.signIn,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const ForgotPasswordTextsFieldsSection(),
                    GradientButton(
                      onPressed: () {
                        if (ForgotPasswordCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          ForgotPasswordCubit.get(context).resetPassword();
                        }
                      },
                      title: Text(
                        AppStrings.resetPassword,
                        style: AppStyles.styleRegular16Black
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
