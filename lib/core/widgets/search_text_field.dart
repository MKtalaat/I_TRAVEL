import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/app_styles.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChange,  this.onEditingComplete,
  });

  final TextEditingController controller;
  final Function(String) onChange;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onEditingComplete:onEditingComplete,
      controller: controller,
      maxLines: 1,
      cursorColor: AppColors.primary,
      onChanged: onChange,
      style: AppStyles.styleRegular18White.copyWith(
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: AppStrings.searchHintText,
        hintStyle: AppStyles.styleRegular16Black.copyWith(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
