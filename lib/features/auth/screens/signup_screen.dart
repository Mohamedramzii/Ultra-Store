import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/auth/refactors/signup_body.dart';
import 'package:full_ecommerce_app/features/auth/widgets/bottom_shape.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CustomPaint(
        size: Size(double.infinity, 50.h),
        painter: AuthBottomCustomPainter(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkDark,
                  ]
                : [
                    LightColors.bluePinkLight,
                    LightColors.bluePinkLight,
                    LightColors.bluePinkLight,
                    LightColors.bluePinkDark,
                  ],
          ),
        ),
      ),
      body: const SafeArea(child: SignupBody()),
    );
  }
}
