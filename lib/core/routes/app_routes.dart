// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:full_ecommerce_app/core/common/screens/under_build_screen.dart';
import 'package:full_ecommerce_app/core/routes/base_routes.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/home_screen.dart';
import 'package:full_ecommerce_app/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:full_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:full_ecommerce_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:full_ecommerce_app/features/customer/presentation/screens/home_screen.dart';
import 'package:full_ecommerce_app/homescreen.dart';
import 'package:full_ecommerce_app/splash_screen.dart';

class AppRoutes {
  static const String splasScreen = 'splash';
  static const String loginscreen = 'loginscreen';
  static const String signupscreen = 'signupscreen';
  static const String adminHomescreen = 'adminHomescreen';
  static const String customerHomescreen = 'customerHomescreen';
  static const String homescreen = 'HomeScreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case splasScreen:
        return BaseRoute(page: const Splash());
      case homescreen:
        return BaseRoute(page: const HomeScreen());
      case loginscreen:
        return BaseRoute(
          page: const LoginScreen(),
        );
      case signupscreen:
        return BaseRoute(page: const signUpScreen());
      case adminHomescreen:
        return BaseRoute(page: const AdminHomeScreen());
      case customerHomescreen:
        return BaseRoute(page: const CustomerHomeScreen());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
