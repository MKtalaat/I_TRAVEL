import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/custom_search_field.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/places_list_view_vertical.dart';

class PlacesViewBody extends StatelessWidget {
  const PlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesSuccessState ||
            state is GetSearchedPlacesList ||
            state is ChangePlaceIndexState) {
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
                  controller: PlacesCubit.get(context).searchController,
                  onChanged: (value) {
                    PlacesCubit.get(context).getSearchedPlacesList(
                      placeName: value,
                    );
                  },
                ),
                Gap(AppConstants.size10h),
                PlacesListViewVertical(
                  places: PlacesCubit.get(context).searchController.text.isEmpty
                      ? PlacesCubit.get(context).places
                      : PlacesCubit.get(context).searchedPlacesList,
                ),
              ],
            ),
          );
        } else if (state is PlacesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
