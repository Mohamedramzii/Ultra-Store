// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/common/animations/custom_direction_animation.dart';
// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/core/utils/app_regex.dart';
import 'package:full_ecommerce_app/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class SignUpTextFormFieldWidget extends StatefulWidget {
  const SignUpTextFormFieldWidget({super.key});

  @override
  State<SignUpTextFormFieldWidget> createState() =>
      _SignUpTextFormFieldWidgetState();
}

class _SignUpTextFormFieldWidgetState extends State<SignUpTextFormFieldWidget> {

  bool isVisible = true;
  late AuthCubit _cubit;


  @override
  void initState() {
    super.initState();
    _cubit = context.read<AuthCubit>();
  }

  @override
  void dispose() {
    _cubit.emailcontroller.dispose();
    _cubit.passwordcontroller.dispose();
    _cubit.fullnamecontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _cubit.formKey,
        child: CustomFadeInAnimation(
      child: Column(
        children: [
          //! Full name
          CustomTextField(
            controller:  _cubit.fullnamecontroller,
            hintText: context.translate(LangKeys.fullName),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.length <= 1 || value.isEmpty) {
                return context.translate(LangKeys.validName);
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 20.h),

          //! Email address
          CustomTextField(
            controller:  _cubit.emailcontroller,
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
            controller:  _cubit.passwordcontroller,
            hintText: context.translate(LangKeys.password),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
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
