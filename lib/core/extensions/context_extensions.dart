import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<dynamic> pushNamed(String pageName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(pageName, arguments: arguments);
  }

  Future<dynamic> pushNamedReplacement(String pageName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(pageName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String pageName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(pageName, (route) => false);
  }

  void pop() {
    return Navigator.pop(this);
  }
}
