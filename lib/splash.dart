// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:full_ecommerce_app/homescreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen (splash: Column(
      children: [
        Center(
          child: LottieBuilder.asset('assets/images/splashh.json', repeat: false,),
        ),
      ],
    ), nextScreen: const HomeScreen(), splashIconSize: 400.r,);
  }
}
