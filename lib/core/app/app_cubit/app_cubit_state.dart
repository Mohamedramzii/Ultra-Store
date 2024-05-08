part of 'app_cubit.dart';

@immutable
sealed class AppCubitState {}

final class AppInitial extends AppCubitState {}

//! Theme Mode State
final class AppThemeChanged extends AppCubitState {
  AppThemeChanged({required this.isDark});

  final bool isDark;
}

//! Language Mode State
final class AppLanguageChanged extends AppCubitState {
  AppLanguageChanged({required this.locale});

  final Locale locale;
}

//! Image Picker State

final class ImageChangedsuccessfully extends AppCubitState {}

final class ImageUploadedSuccessfully extends AppCubitState {}

final class ImageUploadedLoadingState extends AppCubitState {}

final class ImageUploadedFailureState extends AppCubitState {}
