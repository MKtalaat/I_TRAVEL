import 'package:get_it/get_it.dart';
import 'package:i_travel/core/database/database_service_implementation.dart';
import 'package:i_travel/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:i_travel/feature/home/data/repository/home_repository_implementaion.dart';
import 'package:i_travel/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:i_travel/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_travel/feature/plan/data/repository/plan_repository_implementation.dart';
import 'package:i_travel/feature/plan/presentation/cubits/paln_cubit/plan_cubit.dart';
import 'package:i_travel/feature/profile/data/repository/profile_repository_implementation.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //Auth Repo ( Login Cubit - Register Cubit - Forgot Password Cubit )
  getIt.registerSingleton<AuthenticationRepositoryImplementation>(
      AuthenticationRepositoryImplementation());
  getIt.registerFactory(
      () => LoginCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(
      () => RegisterCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  getIt.registerFactory(() =>
      ForgotPasswordCubit(getIt.get<AuthenticationRepositoryImplementation>()));
  // OnBoarding Cubit
  getIt.registerSingleton<OnBoardingCubit>(OnBoardingCubit());
  // Animated Drawer Cubit
  getIt.registerFactory(
          () => AnimatedDrawerCubit());
 // Home Repo ( Places Cubit - Hotels Cubit - Restaurants Cubit - Trips Cubit )
  getIt.registerSingleton<HomeRepositoryImplementation>(
      HomeRepositoryImplementation());
  getIt.registerFactory(
          () => PlacesCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
          () => HotelsCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
          () => RestaurantsCubit(getIt.get<HomeRepositoryImplementation>()));
  getIt.registerFactory(
          () => TripsCubit(getIt.get<HomeRepositoryImplementation>()));
  //Profile Repo ( Profile Cubit )
  getIt.registerSingleton<ProfileRepositoryImplementation>(
      ProfileRepositoryImplementation());
  getIt.registerFactory(
          () => ProfileCubit(getIt.get<ProfileRepositoryImplementation>()));
  //Slider Details Cubit
  getIt.registerFactory(() => ItemDetailsCubit());
  //Internet Connection Cubit
  getIt.registerFactory(() => InternetConnectionCubit());
  //Plan Repo ( Database Service - Plan Cubit )
  getIt.registerSingleton<DatabaseServiceImplementation>(
      DatabaseServiceImplementation());
  getIt.registerSingleton<PlanRepositoryImplementation>(
      PlanRepositoryImplementation(getIt.get<DatabaseServiceImplementation>()));
  getIt.registerFactory(
          () => PlanCubit(getIt.get<PlanRepositoryImplementation>()));

}
