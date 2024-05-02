import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:full_ecommerce_app/core/services/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/shared_pref.dart';

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
}
