import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/services/local/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/local/shared_pref.dart';
import 'package:full_ecommerce_app/core/services/network/dio_helper.dart';
import 'package:full_ecommerce_app/features/auth/data/models/login_response_model.dart';
import 'package:full_ecommerce_app/features/auth/data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AppInitial());

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginResponseModel? loginResponse;
  dynamic accessToken = '';
  Future<void> login({required String email, required String password}) async {
    emit(UserLoginLoadingState());

    try {
      final response = await DioHelper.postData(
        url: loginEP,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        // loginResponse = LoginResponseModel.fromJson(response.data);
        accessToken = response.data['access_token'];
        await SharedPref().setString(
          SharedKeys.tokenKey,
          accessToken.toString(),
        );
        await getUserInformation();
        emit(UserLoginSuccessState());
        // log('User Login Token: ${loginResponse!.accessToken!}');
      } else {
        log(response.statusCode.toString());
        emit(
          UserLoginFailureState(
            errorMessage: 'damn',
          ),
        );
      }
    } catch (e) {
      emit(
        UserLoginFailureState(
          errorMessage: e.toString(),
        ),
      );
      log('User Login Failure : $e');
    }
  }

//! Register

String imageURL='';
  Future<void> register(
      {required String fullname,
      required String email,
      required String password,
      // required String avatar,
      BuildContext? context}) async {
    emit(UserRegisterLoadingState());
    
    await Future.delayed(const Duration(seconds: 3), () {
      imageURL =context!.read<AppCubit>().imageURL!;
      return imageURL;
    },);
    try {
      final response = await DioHelper.postData(
        url: createUserEP,
        data: {
          'name': fullname,
          'email': email,
          'password': password,
          'avatar': imageURL
        },
      );

      if (response.statusCode == 201) {

        emit(UserRegisterSuccessState());
        // log('User Login Token: ${loginResponse!.accessToken!}');
      } else {
        log(response.statusCode.toString());
        emit(
          UserRegisterFailureState(
            errorMessage: 'damn',
          ),
        );
      }
    } catch (e) {
      emit(
        UserLoginFailureState(
          errorMessage: e.toString(),
        ),
      );
      log('User Register Failure : $e');
    }
  }

  

  UserModel? userModel;
  Future<void> getUserInformation() async {
    emit(GetUserInformationLoadingState());

    tokenHolder = SharedPref().getString(SharedKeys.tokenKey)!.trim();
    log(tokenHolder.toString());
    Response response = await DioHelper.getData(
      url: getUserInfoEP,
      token: 'Bearer $tokenHolder',
    );

    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.data as Map<String, dynamic>);
      await SharedPref().setString(SharedKeys.userRole, userModel!.role!);
      emit(
        GetUserInformationSuccessState(
          userRole: userModel!.role!,
        ),
      );
    } else {
      emit(
        GetUserInformationFailureState(
          errorMessage: response.statusMessage.toString(),
        ),
      );
    }
  }
}
