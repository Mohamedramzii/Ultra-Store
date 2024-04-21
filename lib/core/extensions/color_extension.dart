import 'package:flutter/material.dart';


class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.kprimaryColor});

  final Color? kprimaryColor;

  @override
  ThemeExtension<AppColors> copyWith({Color? primarycolor}) {
    return AppColors(kprimaryColor: kprimaryColor);
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(kprimaryColor: kprimaryColor);
  }

  // static const AppColors darkColors = AppColors(
  //   kprimaryColor: DarkColors.kprimaryColor,
  // );
  // static const AppColors lightColors = AppColors(
  //   kprimaryColor: LightColors.kprimaryColor,
  // );

  
}
