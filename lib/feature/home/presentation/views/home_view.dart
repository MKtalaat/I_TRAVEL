import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/functions/show_snack_bar.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/widgets/no_internet_widget.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_state.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
      builder: (context, state) {
        return AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          transform: Matrix4.translationValues(
              AnimatedDrawerCubit.get(context).xOffset,
              AnimatedDrawerCubit.get(context).yOffset,
              0)
            ..scale(AnimatedDrawerCubit.get(context).scaleFactor),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                AnimatedDrawerCubit.get(context).isOpenDrawer
                    ? AppConstants.radius20r
                    : 0.0),
          ),
          child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            builder: (context, state) {
              if (InternetConnectionCubit.get(context).isInternet) {
                return const HomeViewBody();
              } else {
                return NoInternetWidget(
                  onPressed: () {
                    InternetConnectionCubit.get(context)
                        .checkInternetConnection()
                        .then(
                      (value) {
                        if (InternetConnectionCubit.get(context).isInternet) {
                          ProfileCubit.get(context).getUserData();
                          PlacesCubit.get(context).getPlaces();
                          HotelsCubit.get(context).getHotels();
                          RestaurantsCubit.get(context).getRestaurants();
                          TripsCubit.get(context).getTrips();
                        } else {
                          showErrorSnackBar(
                              context: context,
                              message: AppStrings.noInternetTitle);
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
