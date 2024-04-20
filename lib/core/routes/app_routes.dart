import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/common/screens/under_build_screen.dart';
import 'package:full_ecommerce_app/core/routes/base_routes.dart';
import 'package:full_ecommerce_app/homescreen.dart';
import 'package:full_ecommerce_app/testscreen.dart';

class AppRoutes {
  static const String homescreen = 'HomeScreen';
  static const String testscreen = 'TestScreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case homescreen:
        return BaseRoute(page: const HomeScreen());
      case testscreen:
        return BaseRoute(page: const TestScreen());
      default:
        return BaseRoute(page:  const PageUnderBuildScreen());
    }
  }
}
