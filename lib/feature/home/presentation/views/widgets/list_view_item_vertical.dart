import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

class ListViewItemVertical extends StatelessWidget {
  const ListViewItemVertical({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.itemDetailsView,arguments: item);
      },
      child: Container(
        padding:  EdgeInsets.all(AppConstants.size10h),
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(AppConstants.radius8r),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CustomNetworkImage(
                image: item.images[0],
              ),
            ),
             SizedBox(
              width: AppConstants.size5w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleBold16Black,
                  ),
                  Row(
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
                  Text(
                    '${item.price} EGP',
                    style: AppStyles.styleRegular15Grey.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
