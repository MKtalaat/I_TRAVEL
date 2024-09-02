import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_empty_widget.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/list_view_item_vertical.dart';

class RestaurantsListViewVertical extends StatelessWidget {
  const RestaurantsListViewVertical({super.key, required this.restaurants});

  final List<ItemModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsState>(
      builder: (context, state) {
        if (restaurants.isNotEmpty) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: AppConstants.defaultPadding,
                top: AppConstants.size5h,
              ),
              itemCount: restaurants.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListViewItemVertical(
                item: restaurants[index],
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.size10h),
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: CustomEmptyWidget(
                imagePath: AppAssets.search,
                title: AppStrings.noResultTitle,
                subtitle: AppStrings.noResultSubtitle,
              ),
            ),
          );
        }
      },
    );
  }
}
