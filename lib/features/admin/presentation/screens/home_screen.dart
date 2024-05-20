import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';

import 'package:full_ecommerce_app/features/admin/presentation/screens/dashboard_screen.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/drawer_list.dart';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHomeScreen> {
  final _controller = ZoomDrawerController();
  Widget page = const AdminDashboardScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: Builder(
          builder: (context) {
            return MenuScreen(
              onPageChanged: (e) {
                setState(() {
                  page = e;
                });
                ZoomDrawer.of(context)!.close();
              },
            );
          },
        ),
        mainScreen: page,
        controller: _controller,
        borderRadius: 25.r,
        showShadow: true,
        angle: 5,
        menuBackgroundColor:
            context.isDarkMode ? DarkColors.bluePinkDark : Colors.white38,
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    required this.onPageChanged,
    super.key,
  });
  // ignore: inference_failure_on_function_return_type
  final Function(Widget) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.isDarkMode ? DarkColors.bluePinkDark : Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: adminDrawerList(context)
            .map((e) => ListTile(
                leading: e.icon,
                title: e.title,
                onTap: () {
                  onPageChanged(e.page);
                }))
            .toList(),
      ),
    );
  }
}


