import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {},
      width: double.infinity,
      child: Text(
        context.translate(LangKeys.signUp),
        style: context.textStyle.headlineSmall,
      ),
    );
  }
}
