// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';

// Project imports:
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: animationDuration),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Or ${context.translate(LangKeys.createAccount)} ?',
          style: context.textStyle.headlineSmall,
        ),
      ),
    );
  }
}
