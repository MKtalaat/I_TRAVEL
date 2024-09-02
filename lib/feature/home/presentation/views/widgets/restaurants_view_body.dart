import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/custom_search_field.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/restaurants_list_view_vertical.dart';

class RestaurantsViewBody extends StatelessWidget {
  const RestaurantsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsState>(
      builder: (context, state) {
        if (state is RestaurantsSuccessState ||
            state is GetSearchedRestaurantsList) {
          return Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              top: AppConstants.defaultPadding,
            ),
            child: Column(
              children: [
                CustomSearchField(
                  hintText: AppStrings.searchHintText,
                  controller: RestaurantsCubit.get(context).searchController,
                  onChanged: (value) {
                    RestaurantsCubit.get(context).getSearchedRestaurantsList(
                      restaurantsName: value,
                    );
                  },
                ),
                Gap(AppConstants.size10h),
                RestaurantsListViewVertical(
                  restaurants: RestaurantsCubit.get(context).searchController.text.isEmpty
                      ? RestaurantsCubit.get(context).restaurants
                      : RestaurantsCubit.get(context).searchedRestaurantsList,
                ),
              ],
            ),
          );
        } else if (state is RestaurantsFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
