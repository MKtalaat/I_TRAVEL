import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/utils/app_assets.dart';
import 'package:i_travel/feature/onboarding/presentation/cubit/onboarding_state.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: AppAssets.world,
        title: 'ITravel',
        body:
            'It is an application for displaying hotels, restaurants, trips, and tourist places.'),
    BoardingModel(
        image: AppAssets.plan,
        title: 'ITravel',
        body:
            'Create your plan and determine your tourist destinations.'),
    BoardingModel(
        image: AppAssets.explore,
        title: 'ITravel',
        body: 'Join us and explore your tourist destinations'),
  ];

  bool isLast = false;

  void onChangePageView(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
      emit(OnChangePageViewState());
    } else {
      isLast = false;
      emit(OnChangePageViewState());
    }
  }
}
