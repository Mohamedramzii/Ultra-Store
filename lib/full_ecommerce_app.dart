// Flutter imports:

// Package imports:
import 'package:adaptive_theme/adaptive_theme.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
// Project imports:
import 'package:full_ecommerce_app/core/app/connectivity_controller.dart';
import 'package:full_ecommerce_app/core/app/env.variables.dart';
import 'package:full_ecommerce_app/core/common/screens/no_network_screen.dart';
import 'package:full_ecommerce_app/core/di/injection_container.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/core/services/local/shared_keys.dart';
import 'package:full_ecommerce_app/core/services/local/shared_pref.dart';
import 'package:full_ecommerce_app/core/style/theme/app_theme.dart';
import 'package:full_ecommerce_app/language/app_localizations_setup.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.savedThemeMode, super.key});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => getIt<AppCubit>()..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) => AdaptiveTheme(
                light: lightTheme(),
                dark: darkTheme(),
                // debugShowFloatingThemeButton: true,
                initial: savedThemeMode ?? AdaptiveThemeMode.system,
                builder: (lightTheme, darkTheme) =>
                    BlocBuilder<AppCubit, AppCubitState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    final cubit = context.read<AppCubit>();
                    return MaterialApp(
                      debugShowCheckedModeBanner:
                          EnvVariable.instance.debugMode,
                      title: 'Flutter Demo',
                      theme: lightTheme,
                      darkTheme: darkTheme,
                      builder: (context, widget) {
                        return GestureDetector(
                          onTap: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
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
                      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      initialRoute:
                          SharedPref().getString(SharedKeys.tokenKey) == null
                              ? SharedPref().getString(SharedKeys.userRole) ==
                                      'admin'
                                  ? AppRoutes.adminHomescreen
                                  : AppRoutes.customerHomescreen
                              : AppRoutes.splasScreen,
                      locale: Locale(cubit.currentLanguage),
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                      // home: const Splash(),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return AdaptiveTheme(
            light: lightTheme(),
            dark: darkTheme(),
            initial: savedThemeMode ?? AdaptiveThemeMode.system,
            builder: (light, dark) => MaterialApp(
              theme: light,
              darkTheme: dark,
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              title: 'Flutter Demo',
              home: const NoInternetScreen(),
            ),
          );
        }
      },
    );
  }
}
