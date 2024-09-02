import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/custom_search_field.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/trips_list_view_vertical.dart';

class TripsViewBody extends StatelessWidget {
  const TripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        if (state is TripsSuccessState ||
            state is GetSearchedTripsList) {
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
                  controller: TripsCubit.get(context).searchController,
                  onChanged: (value) {
                    TripsCubit.get(context).getSearchedTripsList(
                      tripName: value,
                    );
                  },
                ),
                Gap(AppConstants.size10h),
                TripsListViewVertical(
                  trips: TripsCubit.get(context).searchController.text.isEmpty
                      ? TripsCubit.get(context).trips
                      : TripsCubit.get(context).searchedTripsList,
                ),
              ],
            ),
          );
        } else if (state is TripsFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
