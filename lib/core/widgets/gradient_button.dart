import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/core/utils/app_colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.radius,
  });

  final VoidCallback? onPressed;
  final Widget title;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.w),
          gradient: const LinearGradient(
            colors: AppColors.indigoGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      child: MaterialButton(
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
