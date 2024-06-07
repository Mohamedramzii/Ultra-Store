import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/core/style/images/app_images.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/dashboard/custom_dashboard_containers.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<AdminCubit>();
        return LiquidPullToRefresh(
          animSpeedFactor: 2.5,
          springAnimationDurationInMilliseconds: 700,
          color: context.isDarkMode
              ? DarkColors.bluePinkDark
              : LightColors.bluePinkLight,
          showChildOpacityTransition: false,
          onRefresh: () {
            cubit
              ..products = []
              ..categories = []
              ..users = [];

            return cubit.getAllProducts()
              ..then((value) => cubit.getAllCategories())
                  .then((value) => cubit.getAllUsers());
          },
          child: ListView(
            children: [
              DashboardContainer(
                cubit: cubit,
                state: state,
                title: 'Products',
                total: cubit.products.length,
                image: AppImages.productsDrawer,
              ),
              DashboardContainer(
                cubit: cubit,
                state: state,
                title: 'Categories',
                total: cubit.categories.length,
                image: AppImages.categoriesDrawer,
              ),
              DashboardContainer(
                cubit: cubit,
                state: state,
                title: 'Users',
                total: cubit.users.length,
                image: AppImages.usersDrawer,
              ),
            ],
          ),
        );
      },
    );
  }
}
