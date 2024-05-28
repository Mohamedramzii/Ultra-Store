part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

//! Get Products States
final class AdminGetAllProductsSuccessState extends AdminState {}

final class AdminGetAllProductsLoadingState extends AdminState {}

final class AdminGetAllProductsFailureState extends AdminState {}

//! Get Categories States
final class AdminGetAllCategoriesSuccessState extends AdminState {}

final class AdminGetAllCategoriesLoadingState extends AdminState {}

final class AdminGetAllCategoriesFailureState extends AdminState {}


//! Get Users States
final class AdminGetAllUsersSuccessState extends AdminState {}

final class AdminGetAllUsersLoadingState extends AdminState {}

final class AdminGetAllUsersFailureState extends AdminState {}
