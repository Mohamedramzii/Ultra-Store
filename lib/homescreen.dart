// Flutter imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';


// Project imports:
import 'package:full_ecommerce_app/core/style/fonts/app_font_family.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ultra')),
      body: Column(
        children: [
          Text(
            context.translate(LangKeys.appName),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'بعض البيانات',
            style: TextStyle(
                fontSize: 25.sp, fontFamily: FontFamily.arabicFontCairo),
          ),
          TextButton(
            onPressed: () {
              // context.pushNamed(AppRoutes.testscreen);
              AdaptiveTheme.of(context).toggleThemeMode();
            },
            child: Text(
              'Go to test screen',
              style: TextStyle(),
            ),
          ),
          Switch(
            value: AdaptiveTheme.of(context).mode.isDark,
            onChanged: (value) {
              if (value) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
          ),
        ],
      ),
    );
  }
}
