// Flutter imports:

// Package imports:
import 'package:animated_splash_screen/animated_splash_screen.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Project imports:
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.slideTransition,
      curve: Curves.bounceIn,
      backgroundColor:
          context.isDarkMode ? DarkColors.mainColor : LightColors.mainColor,
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/images/splashh.json',
              repeat: false,
            ),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 400.r,
    );
  }
}
