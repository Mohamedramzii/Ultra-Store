import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/language/app_localizations.dart';

extension ContextExtension on BuildContext {
//! Localization
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

//! Navigation
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

  //! Text
  TextTheme get textStyle => Theme.of(this).textTheme;

  //! Colors Theme

  // AppColors color = Theme.of(this).extensions<AppColors>()!;
}
