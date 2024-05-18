import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            context.isDarkMode ? DarkColors.mainColor : LightColors.mainColor,
        leading: IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: Icon(
            Icons.menu,
            color: context.isDarkMode
                ? LightColors.mainColor
                : DarkColors.mainColor,
          ),
        ),
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Center(
        child: Text(
          'Admin Dashboard Screen',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
