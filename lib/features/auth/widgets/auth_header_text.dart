// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class AuthHeaderTextWidget extends StatelessWidget {
  const AuthHeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: animationDuration),
      child: Column(
        children: [
          Text(
            context.translate(LangKeys.login),
            style: context.textStyle.displayLarge,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            context.translate(LangKeys.welcome),
            style: context.textStyle.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
