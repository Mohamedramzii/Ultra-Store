import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/auth_header_text.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/signup/have_an_account_text.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/signup/signup_button.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/signup/signup_textformfield.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/signup/user_avatar_image.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/theme_lang_buttons.dart';

import 'package:full_ecommerce_app/language/lang_keys.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Theme and Language Modes Buttons
            const ThemeAndLanguageButtons(),
            SizedBox(height: 50.h),
            // the upper welcome message
            const AuthHeaderTextWidget(
              upperText: LangKeys.signUp,
              lowerText: LangKeys.signUpWelcome,
            ),
            SizedBox(height: 20.h),
            const UserAvatarImage(),
            // Signup Form
            SizedBox(height: 20.h),
            const SignUpTextFormFieldWidget(),
            SizedBox(height: 20.h),
            // button
            const SignUpButton(),
            // already have an account text
            const HaveAnAccountText(),
          ],
        ),
      ),
    );
  }
}
