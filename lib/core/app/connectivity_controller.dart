// // Dart imports:
// import 'dart:developer';

// // Package imports:
// import 'package:connectivity_plus/connectivity_plus.dart';
// // Flutter imports:
// import 'package:flutter/material.dart';

// class ConnectivityController {
//   ConnectivityController._();

//   static final ConnectivityController instance = ConnectivityController._();

//   ValueNotifier<bool> isConnected = ValueNotifier(true);
//   Future<void> init() async {
//     // ignore: omit_local_variable_types
//     final List<ConnectivityResult> connectivityResult =
//         await Connectivity().checkConnectivity();
//     isInternetConnected(connectivityResult);
//     Connectivity().onConnectivityChanged.listen(isInternetConnected);
//   }

//   bool isInternetConnected(List<ConnectivityResult> connectivityResult) {
//     if (connectivityResult.contains(ConnectivityResult.none)) {
//       isConnected.value = false;
//       log('No Internet connection');
//       return false;
//     } else if (connectivityResult.contains(ConnectivityResult.wifi) ||
//         connectivityResult.contains(ConnectivityResult.mobile)) {
//       isConnected.value = true;
//       log('Internet connection');
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
