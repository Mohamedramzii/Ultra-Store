import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:full_ecommerce_app/full_ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
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
  ]);
  runApp(const MyApp());
}
