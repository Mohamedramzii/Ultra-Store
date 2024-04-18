// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/style/strings.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: LottieBuilder.asset(AppImages.noInternet,repeat: false),
            ),
            const Text(
              'No Internet is available, please check your connection and try again',textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
