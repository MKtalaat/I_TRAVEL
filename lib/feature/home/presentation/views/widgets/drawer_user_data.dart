import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/drawer_user_photp.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';

class DrawerUserData extends StatelessWidget {
  const DrawerUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
      if(state is GetUserDataSuccessState){
        return Row(
          children: [
             DrawerUserPhoto(imagePath: state.userModel.image,),
            SizedBox(width: AppConstants.size10w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${state.userModel.firstName} ${state.userModel.lastName}',
                  maxLines: 1,
                  style: AppStyles.styleRegular16Black.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  state.userModel.email,
                  style: AppStyles.styleRegular13Grey.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        );
      }else{
        return const SizedBox();
      }
    },);
  }
}
