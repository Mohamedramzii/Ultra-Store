// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/services/network/dio_helper.dart';
import 'package:full_ecommerce_app/features/admin/data/models/get_all_categories_model/get_all_categories_model.dart';
import 'package:full_ecommerce_app/features/admin/data/models/get_all_users/get_all_users.dart';
import 'package:full_ecommerce_app/features/admin/data/models/get_products_model/get_products_model.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  List<dynamic> products = [];
  // List<dynamic> newproducts = [];
  Future<void> getAllProducts() async {
    emit(AdminGetAllProductsLoadingState());

    try {
      
        final response = await DioHelper.getData(url: getallproducts);
        if (response.statusCode == 200) {
          products = response.data as List<dynamic>;
          products
              .map((e) => GetProductsModel.fromJson(e as Map<String, dynamic>))
              .toList();
          // products = newproducts;
          emit(AdminGetAllProductsSuccessState());
        }
      
    } on DioError catch (e) {
      log('Products Failed $e');
      emit(AdminGetAllProductsFailureState());
      if (e.type == DioErrorType.connectionError) {
        // Handle connection error
        log('Connection error: ${e.message}');
      } else if (e.type == DioErrorType.badResponse) {
        // Handle response error
        log('Response error: ${e.response?.statusMessage}');
      } else {
        // Handle other errors
        log('Other error: ${e.message}');
      }
    }
  }

  List<dynamic> categories = [];
  Future<void> getAllCategories() async {
    emit(AdminGetAllCategoriesLoadingState());

    try {
      final response = await DioHelper.getData(url: getallcategories);
      if (response.statusCode == 200) {
        categories = response.data as List<dynamic>;
        categories
            .map(
              (e) => GetAllCategoriesModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        emit(AdminGetAllCategoriesSuccessState());
      } else {
        emit(AdminGetAllCategoriesFailureState());
      }
    } on DioError catch (e) {
      log('Categories Failed $e');
      emit(AdminGetAllCategoriesFailureState());
      if (e.type == DioErrorType.connectionError) {
        // Handle connection error
        log('Connection error: ${e.message}');
      } else if (e.type == DioErrorType.badResponse) {
        // Handle response error
        log('Response error: ${e.response?.statusMessage}');
      } else {
        // Handle other errors
        log('Other error: ${e.message}');
      }
    }
  }

  List<dynamic> users = [];

  Future<void> getAllUsers() async {
    emit(AdminGetAllUsersLoadingState());

    try {
      final response = await DioHelper.getData(url: getallusers);

      if (response.statusCode == 200) {
        users = response.data as List<dynamic>;

        users
            .map((e) => GetAllUsers.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(AdminGetAllUsersSuccessState());
      } else {
        emit(AdminGetAllUsersFailureState());
      }
    } on DioError catch (e) {
      log('Users Failed $e');
      emit(AdminGetAllUsersFailureState());
      if (e.type == DioErrorType.connectionError) {
        // Handle connection error
        log('Connection error: ${e.message}');
      } else if (e.type == DioErrorType.badResponse) {
        // Handle response error
        log('Response error: ${e.response?.statusMessage}');
      } else {
        // Handle other errors
        log('Other error: ${e.message}');
      }
    }
  }
}
