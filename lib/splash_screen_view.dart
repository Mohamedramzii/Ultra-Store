// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:full_ecommerce_app/homescreen.dart';
import 'package:lottie/lottie.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(),) );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 180,
          height: 212,
          child: LottieBuilder.asset('assets/images/splashh.json', repeat: false,),
        ),
      ).animate().slide(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInBack,
          begin: const Offset(-0.9, 0),
          end: const Offset(0, 0)),
    );
  }
}
