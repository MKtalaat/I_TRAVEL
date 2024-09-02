

import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

abstract class TripsState {}

final class TripsInitialState extends TripsState {}

class TripsLoadingState extends TripsState {}

class TripsSuccessState extends TripsState {
  final List<ItemModel> trips;

  TripsSuccessState(this.trips);
}

class TripsFailureState extends TripsState {
  final String error;

  TripsFailureState(this.error);
}

class GetSearchedTripsList extends TripsState{}

