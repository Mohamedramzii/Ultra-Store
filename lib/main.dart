// Dart imports:
import 'dart:io';

// Package imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:full_ecommerce_app/core/app/env.variables.dart';
import 'package:full_ecommerce_app/full_ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await Future.wait([
    EnvVariable.instance.init(envType: EnvTypeEnum.dev),
    Future.wait([
      if (Platform.isAndroid)
        Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyBAz5OXsFADMdU-G_rD4_PENdLIYv0i7pU',
            appId: '1:213592688170:android:0014413b30b33eb024a553',
            messagingSenderId: '213592688170',
            projectId: 'ultra-store-86c05',
          ),
        )
      else
        Firebase.initializeApp(),
    ]),
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ).then(
      (_) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        
        runApp( MyApp(savedThemeMode: savedThemeMode));
      }),
  ]);
}
