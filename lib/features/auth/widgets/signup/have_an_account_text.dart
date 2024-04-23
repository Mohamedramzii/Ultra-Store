import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class HaveAnAccountText extends StatelessWidget {
  const HaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: animationDuration),
      child: TextButton(
        onPressed: () {
          context.pushNamedReplacement(AppRoutes.loginscreen);
        },
        child: Text(
          context.translate(LangKeys.youHaveAccount),
          style: context.textStyle.headlineSmall,
        ),
      ),
    );
  }
}
