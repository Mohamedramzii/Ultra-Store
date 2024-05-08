// Flutter imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/common/animations/custom_direction_animation.dart';

// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/language/app_localizations.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class ThemeAndLanguageButtons extends StatelessWidget {
  const ThemeAndLanguageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* theme mode

        CustomFadeInAnimation(
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
        BlocBuilder<AppCubit, AppCubitState>(
          builder: (context, state) {
            return CustomFadeInAnimation(
              child: CustomLinearButton(
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    context.read<AppCubit>().changeLanuageToArabic();
                  } else {
                    context.read<AppCubit>().changeLanuageToEnglish();
                  }
                },
                width: 100.w,
                child: Text(
                  context.translate(LangKeys.langCode),
                  style: context.textStyle.displaySmall,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
