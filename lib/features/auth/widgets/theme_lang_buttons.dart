// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class ThemeAndLanguageButtons extends StatelessWidget {
  const ThemeAndLanguageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* theme mode

        FadeInRight(
          duration: const Duration(milliseconds: animationDuration),
          child: CustomLinearButton(
            onPressed: () {
              // AdaptiveTheme.of(context).toggleThemeMode();
              if (context.isDarkMode) {
                return AdaptiveTheme.of(context).setLight();
              } else if (context.isLightMode) {
                return AdaptiveTheme.of(context).setDark();
              }
            },
            child:
                Icon(context.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ),
        //* Languages mode
        FadeInLeft(
          duration: const Duration(milliseconds: animationDuration),
          child: CustomLinearButton(
            onPressed: () {},
            width: 100.w,
            child: Text(
              context.translate(LangKeys.langCode),
              style: context.textStyle.displaySmall,
            ),
          ),
        ),
      ],
    );
  }
}
