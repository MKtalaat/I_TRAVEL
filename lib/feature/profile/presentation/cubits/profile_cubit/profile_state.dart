

import 'package:i_travel/feature/authentication/data/models/authentication_model.dart';

abstract class ProfileState {}

final class ProfileInitialState extends ProfileState {}

class GetUserDataLoadingState extends ProfileState {}

class GetUserDataSuccessState extends ProfileState {
  final AuthenticationModel userModel;

  GetUserDataSuccessState(this.userModel);
}

class GetUserDataFailureState extends ProfileState {
  final String error;

  GetUserDataFailureState(this.error);
}

class UpdateUserDataLoadingState extends ProfileState {}

class UpdateUserDataSuccessState extends ProfileState {
  final String message;

  UpdateUserDataSuccessState(this.message);
}

class UpdateUserDataFailureState extends ProfileState {
  final String error;

  UpdateUserDataFailureState(this.error);
}

class UploadImageLoadingState extends ProfileState {}

class UploadImageSuccessState extends ProfileState {
  final String message;

  UploadImageSuccessState(this.message);
}

class UploadImageFailureState extends ProfileState {
  final String error;

  UploadImageFailureState(this.error);
}

class SelectImageFromGalleryState extends ProfileState {}