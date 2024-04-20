// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';

// Project imports:
import 'package:full_ecommerce_app/core/style/fonts/app_font_family.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ultra')),
      body: Column(
        children: [
          Text(
            'Some Data',
            style: TextStyle(
                fontSize: 25.sp, fontFamily: FontFamilys.englishFontPoppins),
          ),
          Text(
            'بعض البيانات',
            style: TextStyle(
                fontSize: 25.sp, fontFamily: FontFamilys.arabicFontCairo),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(AppRoutes.testscreen);
            },
            child: const Text('Go to test screen'),
          ),
        ],
      ),
    );
  }
}
