import 'dart:developer';

import 'package:dio/src/response.dart';
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

  getAllProducts() async {
    emit(AdminGetAllProductsLoadingState());

    try {
      final response = await DioHelper.getData(url: getallproducts);
      if (response.statusCode == 200) {
        products = response.data as List<dynamic>;
        products
            .map((e) => GetProductsModel.fromJson(e as Map<String, dynamic>))
            .toList();

        emit(AdminGetAllProductsSuccessState());
      }
    } catch (e) {
      log(e.toString());
      emit(AdminGetAllProductsFailureState());
    }
  }

  List<dynamic> categories = [];
  getAllCategories() async {
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
    } catch (e) {
      log(e.toString());
      emit(AdminGetAllCategoriesFailureState());
    }
  }

  List<dynamic> users = [];

  getAllUsers() async {
    emit(AdminGetAllUsersLoadingState());

    try {
      final response = await DioHelper.getData(url: getallusers);

      if (response.statusCode == 200) {
        users = response.data as List<dynamic>;

        users
            .map((e) => GetAllUsers.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(AdminGetAllUsersSuccessState());
      }
    } catch (e) {
      log(e.toString());
      emit(AdminGetAllUsersFailureState());
    }
  }
}
