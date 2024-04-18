import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/app/connectivity_controller.dart';
import 'package:full_ecommerce_app/core/app/env.variables.dart';

import 'package:full_ecommerce_app/core/common/screens/no_network_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, child) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    ConnectivityController.instance.init();
                    return child!;
                  },
                ),
              );
            },
            home: Scaffold(
              appBar: AppBar(title: const Text('Ultra')),
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
