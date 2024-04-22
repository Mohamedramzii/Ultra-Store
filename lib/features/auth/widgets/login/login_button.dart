// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: animationDuration),
      child: CustomLinearButton(
        onPressed: () {},
        width: double.infinity,
        height: 50.h,
        child: Text(
          context.translate(LangKeys.login),
          style: context.textStyle.displayMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}