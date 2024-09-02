import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';
import 'package:i_travel/feature/profile/data/repository/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, AuthenticationModel>> getUserData({required String userId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> result = await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .get();
      AuthenticationModel user = AuthenticationModel.fromJson(result.data()!);
      return Right(user);
    } on FirebaseException catch (error) {
      return Left(ServerFailure.fromFireBaseException(error.code));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserData({
    required String userId,
    required String firstName,
    required String lastName,
    required String gender,
  }) async {
    try {
      await firebaseFirestore.collection('Users').doc(userId).update({
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
      });
      return const Right('The data has been updated successfully');
    } on FirebaseException catch (error) {
      return Left(ServerFailure.fromFireBaseException(error.code));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadUserImage({
    required String userId,
    required File file,
  })
    async {
      try {
            final Reference reference =  FirebaseStorage.instance.ref(userId);
            await reference.putFile(file);
            String url = await reference.getDownloadURL();
            await firebaseFirestore
                .collection('Users')
                .doc(userId)
                .update({
              'image': url,
            });
        return const Right('Picture has been updated');
      } on FirebaseException catch (error) {
        return Left(ServerFailure.fromFireBaseException(error.code));
      } catch (error) {
        return Left(ServerFailure(error.toString()));
      }
  }

}