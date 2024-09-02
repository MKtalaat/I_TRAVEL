import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';


class DrawerUserPhoto extends StatelessWidget {
  const DrawerUserPhoto({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: AppConstants.radius30r,
      child: imagePath.isEmpty
          ? CircleAvatar(
        radius: AppConstants.radius28r,
        backgroundColor: AppColors.white,
        child: SvgPicture.asset(
          AppAssets.userImage,
          fit: BoxFit.cover,
        ),
      )
          :CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        height: double.infinity,
        errorWidget: (context, url, error) => Icon(
          IconBroken.Info_Square,
          color: AppColors.primary,
          size: AppConstants.iconSize24,
        ),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: AppConstants.radius28r,
        ),
      ),
    );
  }
}
