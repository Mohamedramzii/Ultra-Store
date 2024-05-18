// List<DrawerItemModel>
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/categories_screen.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/dashboard_screen.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/notifications_screen.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/products_screen.dart';
import 'package:full_ecommerce_app/features/admin/presentation/screens/users_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: Icon(
        Icons.dashboard,
        color:
            context.isDarkMode ? LightColors.mainColor : DarkColors.mainColor,
      ),
      title: Text(
        'Dashboard',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      page: const AdminDashboardScreen(),
    ),
    //Categories
    DrawerItemModel(
      icon: Icon(
        Icons.category_outlined,
        color:
            context.isDarkMode ? LightColors.mainColor : DarkColors.mainColor,
      ),
      title: Text(
        'Categories',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      page: const AdminCategoriesScreen(),
    ),
    //Product
    DrawerItemModel(
      icon: Icon(
        Icons.production_quantity_limits,
        color:
            context.isDarkMode ? LightColors.mainColor : DarkColors.mainColor,
      ),
      title: Text(
        'Products',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      page: const AdminProductsScreen(),
    ),
    //Users
    DrawerItemModel(
      icon: Icon(
        Icons.people_alt_rounded,
        color:
            context.isDarkMode ? LightColors.mainColor : DarkColors.mainColor,
      ),
      title: Text(
        'Users',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      page: const AdminUsersSCreen(),
    ),
    //Notifications
    DrawerItemModel(
      icon: Icon(
        Icons.notifications_active,
        color:
            context.isDarkMode ? LightColors.mainColor : DarkColors.mainColor,
      ),
      title: Text(
        'Notifications',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      page: const AdminNotificationsScreen(),
    ),
    //LogOut
    // DrawerItemModel(
    //   icon: const Icon(
    //     Icons.exit_to_app,
    //     color: Colors.white,
    //   ),
    //   title: GestureDetector(
    //     onTap: () {
    //       CustomDialog.twoButtonDialog(
    //         context: context,
    //         textBody: 'Do you want log out?',
    //         textButton1: 'Yes',
    //         textButton2: 'No',
    //         isLoading: false,
    //         onPressed: () async {
    //           await AppLogout().logout();
    //         },
    //       );
    //     },
    //     child: const Text(
    //       'Logout',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontFamily: 'Poppins',
    //         fontWeight: FontWeightHelper.bold,
    //         fontSize: 17,
    //       ),
    //     ),
    //   ),
    //   page: const UsersScreen(),
    // ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
