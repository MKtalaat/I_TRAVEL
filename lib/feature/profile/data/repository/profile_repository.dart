import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, AuthenticationModel>> getUserData({required String userId});

  Future<Either<Failure, String>> updateUserData({
    required String userId,
    required String firstName,
    required String lastName,
    required String gender,
  });
  Future<Either<Failure, String>> uploadUserImage({
    required String userId,
    required File file,
  });
}
