// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

import 'package:full_ecommerce_app/core/common/animations/custom_direction_animation.dart';

// Project imports:

import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/language/app_localizations.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      child: TextButton(
        onPressed: () {
          context.pushNamedReplacement(AppRoutes.signupscreen);
        },
        child: Text(
          AppLocalizations.of(context)!.isEnLocale
              ? 'Or ${context.translate(LangKeys.createAccount)} ?'
              : 'أو ${context.translate(LangKeys.createAccount)} ؟',
          style: context.textStyle.headlineSmall,
        ),
      ),
    );
  }
}
