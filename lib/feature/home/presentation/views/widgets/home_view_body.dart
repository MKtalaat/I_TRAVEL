import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/hotels_list_view_horizontal.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/restaurants_list_view_horizontal.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/sliders_list_view.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/trips_grid_view.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/welcome_message_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: AppConstants.size8h,
                bottom: AppConstants.defaultPadding,
              ),
              child:  const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeMessageWidget(),
                  SlidersListView(),
                  HotelsListViewHorizontal(),
                  RestaurantsListViewHorizontal(),
                  TripsGridView(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
