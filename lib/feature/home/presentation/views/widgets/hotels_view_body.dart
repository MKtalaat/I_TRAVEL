import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/custom_search_field.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/hotels_list_view_vertical.dart';

class HotelsViewBody extends StatelessWidget {
  const HotelsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        if (state is HotelsSuccessState ||
            state is GetSearchedHotelsList) {
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
                  controller: HotelsCubit.get(context).searchController,
                  onChanged: (value) {
                    HotelsCubit.get(context).getSearchedHotelsList(
                      hotelName: value,
                    );
                  },
                ),
                Gap(AppConstants.size10h),
                HotelsListViewVertical(
                  hotels: HotelsCubit.get(context).searchController.text.isEmpty
                      ? HotelsCubit.get(context).hotels
                      : HotelsCubit.get(context).searchedHotelsList,
                ),
              ],
            ),
          );
        } else if (state is HotelsFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
