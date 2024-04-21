class FontFamily {
  FontFamily._();

  static final instance = FontFamily._();

  static const String arabicFontCairo = 'Cairo';
  static const String englishFontPoppins = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = 'ar';
    if (currentLanguage == 'ar') {
      return arabicFontCairo;
    } else {
      return englishFontPoppins;
    }
  }
}
