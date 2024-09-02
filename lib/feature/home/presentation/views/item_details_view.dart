import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_travel/config/icons/icons_broken.dart';
import 'package:i_travel/core/functions/open_map.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/product_details_bottom_nav_bar.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/product_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.black.withOpacity(0.4),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primary,
        body: ProductDetailsViewBody(
          item: item,
        ),
        bottomNavigationBar: ProductDetailBottomNavBar(
          item: item,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openMap(location: item.location);
          },
          backgroundColor: AppColors.white,
          child: Icon(
            IconBroken.Location,
            color: AppColors.redAccent,
            size: AppConstants.iconSize22,
          ),
        ),
      ),
    );
  }
}