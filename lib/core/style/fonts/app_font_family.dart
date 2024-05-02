import 'package:full_ecommerce_app/core/services/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/shared_pref.dart';

class FontFamily {
  FontFamily._();

  static final instance = FontFamily._();

  static const String arabicFontCairo = 'Cairo';
  static const String englishFontPoppins = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = SharedPref().getString(SharedKeys.languageKey);
    if (currentLanguage == 'ar') {
      return arabicFontCairo;
    } else {
      return englishFontPoppins;
    }
  }
}
