import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

class ListViewItemHorizontal extends StatelessWidget {
  const ListViewItemHorizontal({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.itemDetailsView,
          arguments: item,
        );
      },
      child: Container(
        height: 170.h,
        width: 130.h,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomNetworkImage(
                  image: item.images[0],
                ),
              ),
              Gap(AppConstants.size3h),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold16Black,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppConstants.size4h),
                child: Row(
                  children: [
                     Icon(
                      IconBroken.Location,
                      color: AppColors.redAccent,
                      size: AppConstants.iconSize18,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        item.address,
                        style: AppStyles.styleRegular15Grey.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${item.price} EGP',
                style: AppStyles.styleRegular15Grey.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
