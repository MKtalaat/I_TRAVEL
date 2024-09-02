import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/data/repository/home_repository.dart';
import 'package:i_travel/feature/home/presentation/cubits/places_cubit/places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit(this.homeRepository) : super(PlacesInitialState());
  final HomeRepository homeRepository;

  static PlacesCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<ItemModel> places=[];

  Future<void> getPlaces() async {
    emit(PlacesLoadingState());
    Either<Failure, List<ItemModel>> result;
    result = await homeRepository.getPlaces();
    result.fold((failure) {
      emit(PlacesFailureState(failure.error));
    }, (places) {
      this.places =places;
      emit(PlacesSuccessState(places));
    });
  }

  int currentIndex = 0;

  void changeSliderIndex({required int index}){
    currentIndex = index;
    emit(ChangePlaceIndexState());
  }

  List<ItemModel> searchedPlacesList = [];

  void getSearchedPlacesList({required String placeName}) {
    searchedPlacesList = places.where((element) {
      return element.name.toLowerCase().contains(placeName.toLowerCase());
    }).toList();
    emit(GetSearchedPlacesList());
  }


}