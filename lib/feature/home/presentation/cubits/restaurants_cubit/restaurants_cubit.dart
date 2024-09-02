import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/data/repository/home_repository.dart';
import 'package:i_travel/feature/home/presentation/cubits/restaurants_cubit/restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit(this.homeRepository) : super(RestaurantsInitialState());
  final HomeRepository homeRepository;

  static RestaurantsCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<ItemModel> restaurants=[];

  Future<void> getRestaurants() async {
    emit(RestaurantsLoadingState());
    Either<Failure, List<ItemModel>> result;
    result = await homeRepository.getRestaurants();
    result.fold((failure) {
      emit(RestaurantsFailureState(failure.error));
    }, (restaurants) {
      this.restaurants =restaurants;
      emit(RestaurantsSuccessState(restaurants));
    });
  }

  List<ItemModel> searchedRestaurantsList = [];

  void getSearchedRestaurantsList({required String restaurantsName}) {
    searchedRestaurantsList = restaurants.where((element) {
      return element.name.toLowerCase().contains(restaurantsName.toLowerCase());
    }).toList();
    emit(GetSearchedRestaurantsList());
  }


}