import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

import 'home_repository.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<ItemModel>>> getPlaces() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
      await firebaseFirestore.collection('Places').get();
      List<ItemModel> places = result.docs.map((place) {
        return ItemModel.fromJson(place.data());
      }).toList();
      return Right(places);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> getHotels() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
      await firebaseFirestore.collection('Hotels').get();
      List<ItemModel> places = result.docs.map((place) {
        return ItemModel.fromJson(place.data());
      }).toList();
      return Right(places);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> getRestaurants() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
      await firebaseFirestore.collection('Restaurants').get();
      List<ItemModel> restaurants = result.docs.map((place) {
        return ItemModel.fromJson(place.data());
      }).toList();
      return Right(restaurants);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> getTrips() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result =
      await firebaseFirestore.collection('Trips').get();
      List<ItemModel> trips = result.docs.map((place) {
        return ItemModel.fromJson(place.data());
      }).toList();
      return Right(trips);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
