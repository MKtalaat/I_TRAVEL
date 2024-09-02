

import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

abstract class RestaurantsState {}

final class RestaurantsInitialState extends RestaurantsState {}

class RestaurantsLoadingState extends RestaurantsState {}

class RestaurantsSuccessState extends RestaurantsState {
  final List<ItemModel> restaurants;

  RestaurantsSuccessState(this.restaurants);
}

class RestaurantsFailureState extends RestaurantsState {
  final String error;

  RestaurantsFailureState(this.error);
}

class GetSearchedRestaurantsList extends RestaurantsState{}

