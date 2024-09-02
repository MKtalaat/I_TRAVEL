import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:i_travel/core/shimmer/shimmer_sliders_list_view.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/custom_indicator_widget.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/sliders_list_view_item.dart';

class SlidersListView extends StatelessWidget {
  const SlidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesSuccessState ||
            state is ChangePlaceIndexState ||
            state is GetSearchedPlacesList) {
          return Column(
            children: [
              Gap(AppConstants.size10h),
              CarouselSlider.builder(
                itemCount: PlacesCubit.get(context).places.length,
                itemBuilder: (context, index, s) => SlidersListViewItem(
                  item: PlacesCubit.get(context).places[index],
                ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    PlacesCubit.get(context).changeSliderIndex(index: index);
                  },
                  autoPlay: true,
                  aspectRatio:
                      MediaQuery.sizeOf(context).height > 1600 ? 2.8 : 2.2,
                  viewportFraction: 0.80,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                ),
              ),
              Gap(AppConstants.size10h),
              CustomIndicatorWidget(
                count: PlacesCubit.get(context).places.length,
                currentIndex: PlacesCubit.get(context).currentIndex,
              ),
            ],
          );
        } else if (state is PlacesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerSlidersListView();
        }
      },
    );
  }
}
