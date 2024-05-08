part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AppInitial extends AuthCubitState {}

//* Login States
final class UserLoginSuccessState extends AuthCubitState {}

final class UserLoginLoadingState extends AuthCubitState {}

final class UserLoginFailureState extends AuthCubitState {
  UserLoginFailureState({
    required this.errorMessage,
  });
  final String errorMessage;
}
//* Register States
final class UserRegisterSuccessState extends AuthCubitState {}

final class UserRegisterLoadingState extends AuthCubitState {}

final class UserRegisterFailureState extends AuthCubitState {
  UserRegisterFailureState({
    required this.errorMessage,
  });
  final String errorMessage;
}

//* Get User Information states
final class GetUserInformationSuccessState extends AuthCubitState {
  GetUserInformationSuccessState({required this.userRole});

  final String userRole;
}

final class GetUserInformationLoadingState extends AuthCubitState {}

final class GetUserInformationFailureState extends AuthCubitState {
  GetUserInformationFailureState({
    required this.errorMessage,
  });
  final String errorMessage;
}


//! Image Picker State

final class ImageChangedsuccessfully extends AuthCubitState {}

final class ImageUploadedSuccessfully extends AuthCubitState {}

final class ImageUploadedLoadingState extends AuthCubitState {}

final class ImageUploadedFailureState extends AuthCubitState {}
