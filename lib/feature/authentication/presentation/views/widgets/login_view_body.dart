import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/gradient_button.dart';
import 'package:i_travel/core/widgets/title_and_text_button.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:i_travel/feature/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is LoginSuccessState) {
          CacheHelper.setString(key: 'userId', value: state.user.uid);
          AppConstants.userId = state.user.uid;
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(
              context: context, message: 'logged in successfully!');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          color: Colors.white,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                key: LoginCubit.get(context).formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleAndSubtitle(
                      subtitle: AppStrings.signInSubtitle,
                      title: AppStrings.signIn,
                      buttonTitle: AppStrings.signUp,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerView);
                      },
                    ),
                    const LoginTextsFieldsSection(),
                    GradientButton(
                      onPressed: () {
                        if (LoginCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          LoginCubit.get(context).loginWithEmailAndPassword();
                        }
                      },
                      title: Text(
                        AppStrings.signIn,
                        style: AppStyles.styleRegular16Black
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    TitleAndTextButton(
                      title: AppStrings.didYouForgetYourPassword,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      titleForButton: AppStrings.resetPassword,
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
