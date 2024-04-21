
import 'package:flutter/material.dart';
// import 'package:full_ecommerce_app/core/extensions/color_extension.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: DarkColors.black1,
    // extensions: const <ThemeExtension<dynamic>>[AppColors.darkColors],
  );
}

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: LightColors.white,
    //  extensions: const <ThemeExtension<dynamic>>[AppColors.lightColors],
  );
  
}
