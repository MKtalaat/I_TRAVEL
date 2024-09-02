import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_text_field.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordTextsFieldsSection extends StatelessWidget {
  const ForgotPasswordTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: ForgotPasswordCubit.get(context).emailController,

              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.enterEmail;
                }
                return null;
              },
              title: AppStrings.email,
              hintText: AppStrings.enterEmail,
            ),
          ],
        );
      },
    );
  }
}
