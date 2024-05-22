import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/dashboard/custom_dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<AdminCubit>();
        return ListView(
          children: DashboardContainerModel.list(context)
              .map((e) => Custom_Dashboard_Container(
                    title: e.title,
                    total: e.title == 'Products'
                        ? cubit.products.length
                        : e.title == 'Categories'
                            ? cubit.categories.length
                            : e.title == 'Users'
                                ? cubit.users.length
                                : e.total,
                    image: e.image,
                  ))
              .toList(),
        );
      },
    );
  }
}
