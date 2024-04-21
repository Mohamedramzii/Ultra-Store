// Flutter imports:

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Project imports:
import 'package:full_ecommerce_app/core/app/connectivity_controller.dart';
import 'package:full_ecommerce_app/core/app/env.variables.dart';
import 'package:full_ecommerce_app/core/common/screens/no_network_screen.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/core/style/theme/app_theme.dart';
import 'package:full_ecommerce_app/language/app_localizations_setup.dart';
import 'package:full_ecommerce_app/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.savedThemeMode, super.key});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            child: AdaptiveTheme(
              light: lightTheme(),
              dark: darkTheme(),
              initial: savedThemeMode ?? AdaptiveThemeMode.system,
              builder: (theme, darkTheme) => MaterialApp(
                debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                title: 'Flutter Demo',
                theme: theme,
                darkTheme: darkTheme,
                builder: (context, widget) {
                  return GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus() ,
                    child: Scaffold(
                      body: Builder(
                        builder: (context) {
                          ConnectivityController.instance.init();
                          return widget!;
                        },
                      ),
                    ),
                  );
                },
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: AppRoutes.homescreen,
                locale:  const Locale('en'),
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                home: const Splash(),
              ),
            ),
          );
        } else {
          return MaterialApp(
            //
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            title: 'Flutter Demo',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),

            home: const NoInternetScreen(),
          );
        }
      },
    );
  }
}
