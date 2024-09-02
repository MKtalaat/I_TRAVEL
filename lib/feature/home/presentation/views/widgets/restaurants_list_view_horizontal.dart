import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/shimmer/shimmer_item_horizontal.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/title_list_and_view_all.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/list_view_item_horizontal.dart';

class RestaurantsListViewHorizontal extends StatelessWidget {
  const RestaurantsListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsState>(
      builder: (context, state) {
        if (state is RestaurantsSuccessState ||
            state is GetSearchedRestaurantsList) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: Column(
              children: [
                TitleListAndViewAll(
                  title: AppStrings.restaurants,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.restaurantsView);
                  },
                ),
                SizedBox(
                  height: 170.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ListViewItemHorizontal(
                      item: RestaurantsCubit.get(context).restaurants[index],
                    ),
                    separatorBuilder: (context, index) =>
                        Gap(AppConstants.size10w),
                    itemCount: RestaurantsCubit.get(context).restaurants.length,
                  ),
                ),
              ],
            ),
          );
        } else if (state is RestaurantsFailureState) {
          return Padding(
            padding: EdgeInsets.only(top: AppConstants.size30h),
            child: CustomErrorWidget(error: state.error),
          );
        } else {
          return const ShimmerItemHorizontal();
        }
      },
    );
  }
}
