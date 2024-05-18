// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
// import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
// import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
// import 'package:full_ecommerce_app/features/admin/presentation/screens/categories_screen.dart';
// import 'package:full_ecommerce_app/features/admin/presentation/screens/dashboard_screen.dart';
// import 'package:full_ecommerce_app/features/admin/presentation/screens/notifications_screen.dart';
// import 'package:full_ecommerce_app/features/admin/presentation/screens/products_screen.dart';
// import 'package:full_ecommerce_app/features/admin/presentation/screens/users_screen.dart';

// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

// class AdminHomeScreen extends StatefulWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   State<AdminHomeScreen> createState() => _AdminHomeScreenState();
// }

// class _AdminHomeScreenState extends State<AdminHomeScreen> {
//   Widget currentPage = const AdminDashboardScreen();

//   List<ScreenHiddenDrawer> _pages = [];

//   @override
//   Widget build(BuildContext context) {
//     _pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Dashboard',
//           baseStyle: Theme.of(context).textTheme.displayMedium!,
//           selectedStyle: const TextStyle(),
//         ),
//         const AdminDashboardScreen(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Categories',
//           baseStyle: Theme.of(context).textTheme.displayMedium!,
//           selectedStyle: const TextStyle(),
//         ),
//         const AdminCategoriesScreen(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Products',
//           baseStyle: Theme.of(context).textTheme.displayMedium!,
//           selectedStyle: const TextStyle(),
//         ),
//         const AdminProductsScreen(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Notifications',
//           baseStyle: Theme.of(context).textTheme.displayMedium!,
//           selectedStyle: const TextStyle(),
//         ),
//         const AdminNotificationsScreen(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Users',
//           baseStyle: Theme.of(context).textTheme.displayMedium!,
//           selectedStyle: const TextStyle(),
//         ),
//         const AdminUsersSCreen(),
//       ),
//     ];
//     return HiddenDrawerMenu(
//       backgroundColorMenu: context.isDarkMode
//           ? DarkColors.bluePinkDark
//           : LightColors.bluePinkDark,
//       screens: _pages,
//       backgroundColorAppBar:
//           context.isDarkMode ? DarkColors.mainColor : LightColors.mainColor,
//       contentCornerRadius: 30.r,
//       elevationAppBar: 0,
//       isTitleCentered: true,
//       slidePercent: 50,
//       enableShadowItensMenu: true,
//       styleAutoTittleName: Theme.of(context).textTheme.displayMedium,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
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
        menuBackgroundColor: context.isDarkMode
            ? DarkColors.bluePinkDark
            : Colors.white38,
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
      backgroundColor: context.isDarkMode
          ? DarkColors.bluePinkDark
          : Colors.white10,
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

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => ZoomDrawer.of(context)?.toggle(),
//             icon: Icon(Icons.menu)),
//       ),
//     );
//   }
// }
