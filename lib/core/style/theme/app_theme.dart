// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/core/style/fonts/app_font_family.dart';
import 'package:full_ecommerce_app/core/style/fonts/app_font_weights.dart';

// import 'package:full_ecommerce_app/core/extensions/color_extension.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: DarkColors.mainColor,
    // extensions: const <ThemeExtension<dynamic>>[AppColors.darkColors],
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      displayLarge: TextStyle(
        fontSize: 26.sp,
        color: Colors.white,
        fontWeight: FontWeights.bold,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      displayMedium: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeights.medium,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      headlineSmall: TextStyle(
        fontSize: 17.sp,
        color: Colors.white,
        fontWeight: FontWeights.medium,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: LightColors.mainColor,
    //  extensions: const <ThemeExtension<dynamic>>[AppColors.lightColors],
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      displayLarge: TextStyle(
        fontSize: 26.sp,
        color: Colors.black,
        fontWeight: FontWeights.bold,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      displayMedium: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeights.medium,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
      headlineSmall: TextStyle(
        fontSize: 17.sp,
        color: Colors.black,
        fontWeight: FontWeights.medium,
        fontFamily: FontFamily.getLocalizedFontFamily(),
      ),
    ),
  );
}
