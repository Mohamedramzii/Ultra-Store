// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/auth_header_text.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/login/create_account_button.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/login/login_button.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/login/text_form_field_widget.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/theme_lang_buttons.dart';

// Project imports:

import 'package:full_ecommerce_app/language/lang_keys.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // two buttons at headers for theme and language modes
            const ThemeAndLanguageButtons(),
            SizedBox(height: 50.h),
            // the upper welcome message
            const AuthHeaderTextWidget(
              upperText: LangKeys.login,
              lowerText: LangKeys.welcome,
            ),
            SizedBox(height: 20.h),
            // Text Form Fields
            const LoginTextFormFieldWidget(),
            SizedBox(height: 20.h),

            // Login Button
            const LoginButton(),
            SizedBox(height: 20.h),

            // text button to create an account
            const CreateAccountButton(),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
