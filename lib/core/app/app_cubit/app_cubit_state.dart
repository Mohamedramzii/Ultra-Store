part of 'app_cubit_cubit.dart';

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
