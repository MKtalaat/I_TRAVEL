import 'package:flutter/material.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        IconBroken.Arrow___Left_2,
        size: MediaQuery.sizeOf(context).width>780?AppConstants.iconSize24:AppConstants.iconSize28,
        color: color ?? AppColors.primary,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
