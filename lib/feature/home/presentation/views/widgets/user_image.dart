import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(builder: (context, state) {
      if(state is GetUserDataSuccessState||state is SelectImageFromGalleryState){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.profileView);
          },
          child: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.primary,
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.white,
              child: ProfileCubit.get(context).authenticationModel.image.isEmpty
                  ? CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.white,
                child: SvgPicture.asset(
                                    AppAssets.userImage,
                                    fit: BoxFit.cover,
                                  ),
                  )
                  :CachedNetworkImage(
                imageUrl: ProfileCubit.get(context).authenticationModel.image,
                fit: BoxFit.cover,
                height: double.infinity,
                errorWidget: (context, url, error) => Icon(
                  IconBroken.Info_Square,
                  color: AppColors.primary,
                  size: AppConstants.iconSize24,
                ),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 20.r,
                ),
              ),
            ),
          ),
        );
      }else{
        return   ShimmerCircleAvatarEffect(radius: 24.r,);
      }
    },);
  }
}