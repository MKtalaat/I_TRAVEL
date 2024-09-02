import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/core/errors/failures.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';
import 'package:i_travel/feature/profile/data/repository/profile_repository.dart';
import 'package:i_travel/feature/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileInitialState());

  final ProfileRepository profileRepository;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  String? genderDropdownValue;

  var formKey = GlobalKey<FormState>();

  static ProfileCubit get(context) => BlocProvider.of(context);

  late AuthenticationModel authenticationModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await profileRepository.getUserData(
      userId: AppConstants.userId,
    );
    result.fold((failure) {
      emit(GetUserDataFailureState(failure.error));
    }, (authenticationModel) {
      this.authenticationModel = authenticationModel;
      emit(GetUserDataSuccessState(authenticationModel));
    });
  }

  Future<void> updateUserData() async {
    emit(UpdateUserDataLoadingState());
    Either<Failure, String> result;
    result = await profileRepository.updateUserData(
      userId: AppConstants.userId,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: genderDropdownValue!,
    );
    result.fold((failure) {
      emit(UpdateUserDataFailureState(failure.error));
    }, (message) {
      emit(UpdateUserDataSuccessState(message));
    });
  }

  File? image;

  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
      emit(SelectImageFromGalleryState());
  }

  Future<void> uploadUserImage() async {
    emit(UploadImageLoadingState());
    Either<Failure, String> result;
    result = await profileRepository.uploadUserImage(
      userId: AppConstants.userId,
      file:image!,
    );
    result.fold((failure) {
      emit(UploadImageFailureState(failure.error.toString()));
    }, (message) {
      emit(UploadImageSuccessState(message));
    });
  }
}
