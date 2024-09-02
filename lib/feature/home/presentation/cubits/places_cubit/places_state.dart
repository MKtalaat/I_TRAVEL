

import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

abstract class PlacesState {}

final class PlacesInitialState extends PlacesState {}

class PlacesLoadingState extends PlacesState {}

class PlacesSuccessState extends PlacesState {
  final List<ItemModel> places;

  PlacesSuccessState(this.places);
}

class PlacesFailureState extends PlacesState {
  final String error;

  PlacesFailureState(this.error);
}

class ChangePlaceIndexState extends PlacesState{}

class GetSearchedPlacesList extends PlacesState{}

