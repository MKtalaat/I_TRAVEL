import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/custom_text_field.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: LoginCubit.get(context).emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              title: 'Email',
              hintText: 'Enter your email',
            ),
            CustomTextField(
              textInputType: TextInputType.visiblePassword,
              obscureText: LoginCubit.get(context).isShowPassword,
              suffixIcon: InkWell(
                onTap: () {
                  LoginCubit.get(context).changePasswordVisibility();
                },
                child: Icon(
                  LoginCubit.get(context).isShowPassword
                      ? IconBroken.Hide
                      : IconBroken.Show,
                  color: AppColors.grey,
                  size: MediaQuery.sizeOf(context).width>780?AppConstants.iconSize14:AppConstants.iconSize18,
                ),
              ),
              controller: LoginCubit.get(context).passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              title: 'Password',
              hintText: 'Enter your password',
            ),
          ],
        );
      },
    );
  }
}
