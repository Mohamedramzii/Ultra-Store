import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/services/local/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/local/shared_pref.dart';

class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: animationDuration),
      child: child,
    );
  }
}

class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: animationDuration),
      child: child,
    );
  }
}

class CustomFadeInAnimation extends StatelessWidget {
  const CustomFadeInAnimation({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SharedPref().getString(SharedKeys.languageKey) == 'ar'
        ? FadeInLeft(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: animationDuration),
            child: child,
          )
        : FadeInRight(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: animationDuration),
            child: child,
          );
  }
}
