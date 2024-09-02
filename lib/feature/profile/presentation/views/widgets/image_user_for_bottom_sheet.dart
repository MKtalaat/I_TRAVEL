import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';

class ImageUserForBottomSheet extends StatelessWidget {
  const ImageUserForBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 76.r,
                backgroundColor: AppColors.primary,
                child: CircleAvatar(
                  radius: 72.r,
                  backgroundColor: Colors.white,
                  child: ProfileCubit.get(context).image != null
                      ? CircleAvatar(
                          radius: 68.r,
                          backgroundColor: AppColors.white,
                          backgroundImage: Image.file(
                            ProfileCubit.get(context).image!,
                            fit: BoxFit.cover,
                          ).image,
                        )
                      : ProfileCubit.get(context)
                              .authenticationModel
                              .image
                              .isEmpty
                          ? CircleAvatar(
                              radius: 68.r,
                              backgroundColor: AppColors.white,
                              child: SvgPicture.asset(
                                AppAssets.userImage,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl: ProfileCubit.get(context)
                                  .authenticationModel
                                  .image,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              errorWidget: (context, url, error) => Icon(
                                IconBroken.Info_Square,
                                color: AppColors.primary,
                                size: AppConstants.iconSize24,
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: 68.r,
                              ),
                            ),
                ),
              ),
              InkWell(
                onTap: () {
                    ProfileCubit.get(context).getImageGallery();
                },
                child: CircleAvatar(
                  radius: 23.r,
                  backgroundColor: AppColors.grey50,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      IconBroken.Camera,
                      size: MediaQuery.sizeOf(context).width > 780
                          ? AppConstants.iconSize20
                          : AppConstants.iconSize24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
