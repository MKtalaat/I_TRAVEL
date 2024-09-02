import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/date_picker_time_line.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/details_indicator_widget.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/product_details_bottom_nav_bar_add_to_plan.dart';

class ProductDetailBottomNavBar extends StatelessWidget {
  const ProductDetailBottomNavBar({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 9.0,
      elevation: 30.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsIndicatorWidget(item: item),
              Gap(AppConstants.size10h),
              Text(
                item.name,
                style: AppStyles.styleBold20Primary.copyWith(
                  color: AppColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppConstants.size8h,
                  bottom: AppConstants.size5h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About',
                      style: AppStyles.styleRegular18White
                          .copyWith(color: AppColors.primary),
                    ),
                    Row(
                      children: [
                         Icon(
                          IconBroken.Location,
                          color: AppColors.redAccent,
                          size: AppConstants.iconSize18,
                        ),
                        Text(
                          item.address,
                          style: AppStyles.styleRegular18White
                              .copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    item.description,
                    style: AppStyles.styleRegular16Black.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const DatePickerTimeLine(),
              ProductDetailBottomNavBarAddToPlan(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
