import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/data/repository/home_repository.dart';
import 'package:i_travel/feature/home/presentation/cubits/hotels_cubit/hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.homeRepository) : super(HotelsInitialState());
  final HomeRepository homeRepository;

  static HotelsCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<ItemModel> hotels=[];

  Future<void> getHotels() async {
    emit(HotelsLoadingState());
    Either<Failure, List<ItemModel>> result;
    result = await homeRepository.getHotels();
    result.fold((failure) {
      emit(HotelsFailureState(failure.error));
    }, (hotels) {
      this.hotels =hotels;
      emit(HotelsSuccessState(hotels));
    });
  }

  List<ItemModel> searchedHotelsList = [];

  void getSearchedHotelsList({required String hotelName}) {
    searchedHotelsList = hotels.where((element) {
      return element.name.toLowerCase().contains(hotelName.toLowerCase());
    }).toList();
    emit(GetSearchedHotelsList());
  }


}