import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/animations/page_fade_transition.dart';
import 'package:i_travel/core/animations/page_slide_transition.dart';
import 'package:i_travel/core/utils/app_strings.dart';
import 'package:i_travel/core/utils/service_locator.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/views/forgot_password_view.dart';
import 'package:i_travel/feature/authentication/presentation/views/login_view.dart';
import 'package:i_travel/feature/authentication/presentation/views/register_view.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/home/presentation/views/hotels_view.dart';
import 'package:i_travel/feature/home/presentation/views/item_details_view.dart';
import 'package:i_travel/feature/home/presentation/views/layout_view.dart';
import 'package:i_travel/feature/home/presentation/views/places_view.dart';
import 'package:i_travel/feature/home/presentation/views/restaurants_view.dart';
import 'package:i_travel/feature/home/presentation/views/trips_view.dart';
import 'package:i_travel/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_travel/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:i_travel/feature/plan/presentation/views/plan_view.dart';
import 'package:i_travel/feature/profile/presentation/views/profile_view.dart';
import 'package:i_travel/feature/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String forgotPassword = '/forgot_password_view';
  static const String layoutView = '/layout_view';
  static const String onBoardingView = '/onBoarding_view';
  static const String profileView = '/profile_view';
  static const String itemDetailsView = '/item_details_view';
  static const String placesView = '/places_view';
  static const String hotelsView = '/hotels_view';
  static const String restaurantsView = '/restaurants_view';
  static const String tripsView = '/trips_view';
  static const String planView = '/plan_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
              create: (context) => getIt.get<LoginCubit>(),
              child: const LoginView()),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: BlocProvider(
              create: (context) => getIt.get<RegisterCubit>(),
              child: const RegisterView()),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
              create: (context) => getIt.get<OnBoardingCubit>(),
              child: const OnBoardingView()),
        );
      case Routes.forgotPassword:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: BlocProvider(
              create: (context) => getIt.get<ForgotPasswordCubit>(),
              child: const ForgotPasswordView()),
        );
      case Routes.layoutView:
        return PageFadeTransition(
          page: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt.get<AnimatedDrawerCubit>(),
                ),
              ],
              child: const LayoutView()),
        );
      case Routes.itemDetailsView:
        final item = settings.arguments as ItemModel;
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: BlocProvider(
              create: (context) => getIt.get<ItemDetailsCubit>(),
              child:  ItemDetailsView(item: item)),
        );
      case Routes.profileView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const ProfileView(),
        );
        case Routes.placesView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const PlacesView(),
        );
        case Routes.hotelsView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const HotelsView(),
        );
        case Routes.restaurantsView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const RestaurantsView(),
        );
        case Routes.tripsView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const TripsView(),
        );
        case Routes.planView:
        return PageSlideTransition(
          direction: AxisDirection.right,
          page: const PlanView(),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
