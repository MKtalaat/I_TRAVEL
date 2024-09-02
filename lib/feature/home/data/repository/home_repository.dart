import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ItemModel>>> getPlaces();
  Future<Either<Failure, List<ItemModel>>> getHotels();
  Future<Either<Failure, List<ItemModel>>> getRestaurants();
  Future<Either<Failure, List<ItemModel>>> getTrips();
}
