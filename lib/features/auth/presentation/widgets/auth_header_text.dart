// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Project imports:
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class AuthHeaderTextWidget extends StatelessWidget {
  const AuthHeaderTextWidget({
    required this.upperText,
    required this.lowerText,
    super.key,
  });
  final String upperText;
  final String lowerText;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: animationDuration),
      child: Column(
        children: [
          Text(
            context.translate(upperText),
            style: context.textStyle.displayLarge,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            context.translate(lowerText),
            style: context.textStyle.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
