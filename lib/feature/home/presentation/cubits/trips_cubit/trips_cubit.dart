import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/data/repository/home_repository.dart';
import 'package:i_travel/feature/home/presentation/cubits/trips_cubit/trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit(this.homeRepository) : super(TripsInitialState());
  final HomeRepository homeRepository;

  static TripsCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeUrlController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<ItemModel> trips=[];

  Future<void> getTrips() async {
    emit(TripsLoadingState());
    Either<Failure, List<ItemModel>> result;
    result = await homeRepository.getTrips();
    result.fold((failure) {
      emit(TripsFailureState(failure.error));
    }, (trips) {
      this.trips =trips;
      emit(TripsSuccessState(trips));
    });
  }

  List<ItemModel> searchedTripsList = [];

  void getSearchedTripsList({required String tripName}) {
    searchedTripsList = trips.where((element) {
      return element.name.toLowerCase().contains(tripName.toLowerCase());
    }).toList();
    emit(GetSearchedTripsList());
  }


}