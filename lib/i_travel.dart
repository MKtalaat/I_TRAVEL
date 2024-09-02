import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/routes/app_routes.dart';
import 'package:i_travel/config/themes/app_theme.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/service_locator.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class ITravel extends StatelessWidget {
  const ITravel({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<ProfileCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<PlacesCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<HotelsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<RestaurantsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<TripsCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<PlanCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<InternetConnectionCubit>(),
            ),
          ],
          child: MaterialApp(
            title: AppStrings.iTravel,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
