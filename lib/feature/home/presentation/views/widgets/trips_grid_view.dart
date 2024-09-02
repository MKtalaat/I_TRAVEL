import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/core/shimmer/shimmer_grid_view.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/custom_error_widget.dart';
import 'package:i_travel/core/widgets/title_list_and_view_all.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/list_view_item_horizontal.dart';

class TripsGridView extends StatelessWidget {
  const TripsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        if (state is TripsSuccessState ||
            state is GetSearchedTripsList) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: Column(
              children: [
                TitleListAndViewAll(
                  title: AppStrings.trips,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.tripsView);
                  },
                ),
                StaggeredGridView.countBuilder(
                  padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: AppConstants.size10w,
                    mainAxisSpacing: AppConstants.size10w,
                    itemCount:
                    TripsCubit.get(context).trips.length >= 4 ? 4 :  TripsCubit.get(context).trips.length,
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isEven ? 1.4 : 1.2);
                    },
                    itemBuilder: (context, index) {
                      return ListViewItemHorizontal(
                        item:  TripsCubit.get(context).trips[index],
                      );
                    }),
              ],
            ),
          );
        } else if (state is TripsFailureState) {
          return Padding(
            padding: EdgeInsets.only(top: AppConstants.size30h),
            child: CustomErrorWidget(error: state.error),
          );
        } else {
          return const ShimmerTripsGridView();
        }
      },
    );
  }
}
