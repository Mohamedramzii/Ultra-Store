// Dart imports:
import 'dart:io';

// Package imports:
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/app/classobserve.dart';
// Project imports:
import 'package:full_ecommerce_app/core/app/env.variables.dart';
import 'package:full_ecommerce_app/core/di/injection_container.dart';
import 'package:full_ecommerce_app/core/services/local/shared_pref.dart';
import 'package:full_ecommerce_app/core/services/network/dio_helper.dart';
import 'package:full_ecommerce_app/full_ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  // Dio
  DioHelper.init();
  await Future.wait([
    // Environments
    EnvVariable.instance.init(envType: EnvTypeEnum.dev),

    // Firebase

    if (Platform.isAndroid)
      Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBAz5OXsFADMdU-G_rD4_PENdLIYv0i7pU',
          appId: '1:213592688170:android:0014413b30b33eb024a553',
          messagingSenderId: '213592688170',
          projectId: 'ultra-store-86c05',
        ),
      ).then(
        (value) => FirebaseAppCheck.instance
            // Your personal reCaptcha public key goes here:
            .activate(),
      )
    else
      Firebase.initializeApp(),

    // Shared Preferences
    SharedPref().init(),

    // dependency injection
    initDI(),
  ]);

  // Orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    runApp(MyApp(savedThemeMode: savedThemeMode));
  });
}
