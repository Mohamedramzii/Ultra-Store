import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/custom_appbar.dart';


class AdminNotificationsScreen extends StatelessWidget {
  const AdminNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdminAppBar(isMain: true, backgroundColor: context.isDarkMode
            ? DarkColors.mainColor
            : LightColors.mainColor, title: 'Notifications'),
      body: Center(
        child: Text(
          'Admin Notifications Screen',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
