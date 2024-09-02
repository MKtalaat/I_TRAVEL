import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/home/presentation/views/drawer_view.dart';
import 'package:i_travel/feature/home/presentation/views/home_view.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    InternetConnectionCubit.get(context).checkInternetConnection().then((value){
      if(  InternetConnectionCubit.get(context).isInternet){
        ProfileCubit.get(context).getUserData();
        PlacesCubit.get(context).getPlaces();
        HotelsCubit.get(context).getHotels();
        RestaurantsCubit.get(context).getRestaurants();
        TripsCubit.get(context).getTrips();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimatedDrawerCubit, AnimatedDrawerState>(
      builder: (context, state) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: AnimatedDrawerCubit.get(context).isOpenDrawer
                ? AppConstants.systemUiOverlayStyleLight
                : AppConstants.systemUiOverlayStyleDark,
            child: Stack(
              children: [
                const DrawerView(),
                AnimatedContainer(
                  transform: Matrix4.translationValues(
                      AnimatedDrawerCubit.get(context).xOffset2,
                      AnimatedDrawerCubit.get(context).yOffset2,
                      0)
                    ..scale(AnimatedDrawerCubit.get(context).scaleFactor2),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(
                          AnimatedDrawerCubit.get(context).isOpenDrawer
                              ? AppConstants.radius20r
                              : 0.0)),
                ),
                const HomeView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
