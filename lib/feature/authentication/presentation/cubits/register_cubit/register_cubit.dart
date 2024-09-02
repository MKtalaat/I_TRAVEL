import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';
import 'package:i_travel/feature/authentication/data/repository/authentication_repository.dart';
import 'package:i_travel/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authenticationRepository) : super(RegisterInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? genderDropdownValue;

  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  late User user;

  Future<void> registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    Either<Failure, User> result =
    await authenticationRepository.registerWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.error));
    }, (user) async{
      this.user = user;
     await saveUserDataToFirebase();
      emit(RegisterSuccessState(user));
    });
  }


  Future<void> saveUserDataToFirebase() async {
    emit(SaveUserDataLoadingState());
    Either<Failure, String> result =
    await authenticationRepository.saveUserDataToFirebase(
      authenticationModel: AuthenticationModel(
          uid: user.uid,
          email: user.email!,
          image: '',
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          gender: genderDropdownValue!,
          createAt: DateTime.now().toString()),
    );
    result.fold((failure) {
      emit(SaveUserDataFailureState(failure.error));
    }, (message) {
      emit(SaveUserDataSuccessState(message: message));
    });
  }
}
