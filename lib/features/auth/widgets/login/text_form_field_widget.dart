// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/core/utils/app_regex.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  bool isVisible=true;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: FadeInRight(
           duration: const Duration(milliseconds: animationDuration),
          child: Column(
                children: [
          //! Email address
          CustomTextField(
            controller: TextEditingController(),
            hintText: context.translate(LangKeys.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!AppRegex.isEmailValid(value!)) {
                return context.translate(LangKeys.validEmail);
              } else {
                return null;
              }
            },
          ),
           SizedBox(height: 20.h),
          
          //! password
          CustomTextField(
            controller: TextEditingController(),
            hintText: context.translate(LangKeys.password),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible=!isVisible;
                });
              },
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: context.isLightMode
                    ? LightColors.textColor
                    : DarkColors.textColor,
              ),
            ),
            validator: (value) {
              if (value!.length < 6 || value.isEmpty) {
                return context.translate(LangKeys.validPasswrod);
              }
              return null;
            },
          ),
                ],
              ),
        ));
  }
}
