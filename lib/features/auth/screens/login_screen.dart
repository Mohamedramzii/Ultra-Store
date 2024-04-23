// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/auth/refactors/login_body.dart';
import 'package:full_ecommerce_app/features/auth/widgets/bottom_shape.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          100.h,
        ),
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
      body: const SafeArea(
        bottom: false,
        child: LoginBody(),
      ),
    );
  }
}
