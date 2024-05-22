import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/di/injection_container.dart';
import 'package:full_ecommerce_app/core/services/local/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/local/shared_pref.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppInitial());

//! theme Mode State Logic
  bool isDark = true;
  Future<void> appThemeChanged({required bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppThemeChanged(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SharedKeys.themeKey, isDark).then(
        (value) {
          emit(
            AppThemeChanged(isDark: isDark),
          );
        },
      );
    }
  }

  //! Language Mode State Logic

  String currentLanguage = 'en';
  void getSavedLanguage() {
    final result = SharedPref().containPreference(SharedKeys.languageKey)
        ? SharedPref().getString(SharedKeys.languageKey)
        : 'en';
    currentLanguage = result!;

    emit(AppLanguageChanged(locale: Locale(currentLanguage)));
  }

  Future<void> _changeLanguage({required String langCode}) async {
    await SharedPref().setString(SharedKeys.languageKey, langCode);
    currentLanguage = langCode;

    emit(AppLanguageChanged(locale: Locale(currentLanguage)));
  }

  void changeLanuageToArabic() => _changeLanguage(langCode: 'ar');

  void changeLanuageToEnglish() => _changeLanguage(langCode: 'en');

  //! Image Picker method

  File? image;
  Future<File?> pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // ignore: join_return_with_assignment
        image = File(pickedImage.path);
        emit(ImageChangedsuccessfully());
        return image;
      }
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus == PermissionStatus.denied) {
        await _showAlertPermissionDialog();
      } else {
        log('Image Picker Exception ==> $e');
      }
    }
  }

  String? imageURL;

  // returns a url
  Future<String?> uploadImage() async {
    image = await pickImage();

    emit(ImageUploadedLoadingState());

    try {
      final uploadedFile = await firebase_storage.FirebaseStorage.instanceFor(
        bucket: 'gs://ultra-store-86c05.appspot.com',
      )
          .ref()
          .child(
            'users/${Uri.file(image!.path).pathSegments.last}',
          )
          .putFile(image!);

      imageURL = await uploadedFile.ref.getDownloadURL();
      emit(ImageUploadedSuccessfully());
    } on Exception catch (e) {
      emit(ImageUploadedFailureState());
    }
  }

  Future<void> _showAlertPermissionDialog() {
    return showCupertinoDialog(
      context: getIt<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return const CupertinoAlertDialog(
          title: Text(
            'Permission Denied',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            'You need to give permission to access the gallery',
            style: TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
