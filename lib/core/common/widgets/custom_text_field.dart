// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
  });

  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor:
          context.isLightMode ? LightColors.textColor : DarkColors.textColor,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color:
            context.isLightMode ? LightColors.textColor : DarkColors.textColor,
      ),
      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: context.isLightMode
                ? LightColors.textFormBorder
                : DarkColors.textFormBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: context.isLightMode
                ? LightColors.textFormBorder
                : DarkColors.textFormBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.headlineSmall,
        errorStyle: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
