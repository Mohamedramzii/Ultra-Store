import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/dashboard/custom_dashboard_container.dart';


class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: DashboardContainerModel.list(context)
          .map((e) => Custom_Dashboard_Container(
                title: e.title,
                total: e.total,
                image: e.image,
              ))
          .toList(),
    );
  }
}
