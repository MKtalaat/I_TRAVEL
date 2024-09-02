

import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

abstract class HotelsState {}

final class HotelsInitialState extends HotelsState {}

class HotelsLoadingState extends HotelsState {}

class HotelsSuccessState extends HotelsState {
  final List<ItemModel> hotels;

  HotelsSuccessState(this.hotels);
}

class HotelsFailureState extends HotelsState {
  final String error;

  HotelsFailureState(this.error);
}

class GetSearchedHotelsList extends HotelsState{}

