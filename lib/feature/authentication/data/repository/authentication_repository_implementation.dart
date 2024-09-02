import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';
import 'package:i_travel/feature/authentication/data/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, User>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return Right(user!);
    } on FirebaseException catch (error) {
      return Left(ServerFailure.fromFireBaseException(error.code));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return Right(user!);
    } on FirebaseException catch (error) {
      return Left(ServerFailure.fromFireBaseException(error.code));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> saveUserDataToFirebase(
      {required AuthenticationModel authenticationModel}) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(authenticationModel.uid)
          .set(authenticationModel.toJson());
      return const Right('Data Saved Successfully');
    } on FirebaseException catch (error) {
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }




  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(
          'A password recovery link has been sent to your email');
    } on FirebaseException catch (error) {
      return Left(ServerFailure.fromFireBaseException(error.code));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
