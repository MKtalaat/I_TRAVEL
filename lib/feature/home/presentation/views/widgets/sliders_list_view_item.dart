import 'package:flutter/material.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/utils/app_colors.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/custom_network_image.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

class SlidersListViewItem extends StatelessWidget {
  const SlidersListViewItem({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          Routes.itemDetailsView,
          arguments: item,
        );
      },
      child: CustomNetworkImage(
        image: item.images[0],
        backgroundColor: AppColors.grey50,
        borderRadius: AppConstants.radius10r,
      ),
    );
  }
}