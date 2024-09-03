import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_dropdown.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/widgets/custom_text_field.dart';

class RegisterTextsFieldsSection extends StatelessWidget {
  const RegisterTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: RegisterCubit.get(context).firstNameController,
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
                controller: RegisterCubit.get(context).lastNameController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                title: AppStrings.lastName,
                hintText: AppStrings.enterLastName,
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: RegisterCubit.get(context).emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                title: AppStrings.email,
                hintText: AppStrings.enterEmail,
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: RegisterCubit.get(context).passwordController,
                obscureText: RegisterCubit.get(context).isShowPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  },
                  child: Icon(
                    RegisterCubit.get(context).isShowPassword
                        ? IconBroken.Hide
                        : IconBroken.Show,
                    color: AppColors.grey,
                    size: MediaQuery.sizeOf(context).width>780?AppConstants.iconSize14:AppConstants.iconSize18,
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password is too short';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Enter your password',
              ),
              CustomDropdown(
                title: AppStrings.gender,
                hintText: AppStrings.selectGender,
                messageForValidate: AppStrings.pleaseSelectGender,
                items: ['Male','Female']
                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                    .toList(),
                onChange: (value) {
                  RegisterCubit.get(context).genderDropdownValue = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
