import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/shimmer/shimmer_welcome_message.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState ||
            state is SelectImageFromGalleryState) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Hi, ',
                      style: AppStyles.styleRegular22White.copyWith(
                        color: AppColors.redAccent,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${ProfileCubit.get(context).authenticationModel.firstName} ${ProfileCubit.get(context).authenticationModel.lastName}!',
                          style: AppStyles.styleRegular22White.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ]),
                ),
                Text(
                  AppStrings.welcomeMessage,
                  style: AppStyles.styleRegular15Grey,
                ),
              ],
            ),
          );
        } else if (state is GetUserDataFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerWelcomeMessage();
        }
      },
    );
  }
}
