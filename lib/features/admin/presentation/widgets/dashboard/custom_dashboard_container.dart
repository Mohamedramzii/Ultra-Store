import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/common/widgets/loading_shimmer.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/images/app_images.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class Custom_Dashboard_Container extends StatelessWidget {
  const Custom_Dashboard_Container({
    required this.title,
    required this.total,
    required this.image,
    super.key,
  });
  final String title;
  final int total;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
            colors: [
              DarkColors.containerLinear1,
              Colors.black45,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (loading == true)
                    LoadingShimmer(
                      width: 100.w,
                      height: 30.h,
                    )
                  else
                    Text(
                      '$total',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ],
              ),
              Image.asset(
                image,
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardContainerModel {
  DashboardContainerModel(
      {required this.title, required this.total, required this.image});

  final String title;
  final int total;
  final String image;

  static List<DashboardContainerModel> list(BuildContext context) {
    return <DashboardContainerModel>[
      DashboardContainerModel(
        title: context.translate(LangKeys.products),
        total: 100,
        image: AppImages.productsDrawer,
      ),
      DashboardContainerModel(
        title: context.translate(LangKeys.categories),
        total: 100,
        image: AppImages.categoriesDrawer,
      ),
      DashboardContainerModel(
        title: context.translate(LangKeys.users),
        total: 100,
        image: AppImages.usersDrawer,
      ),
    ];
  }
}
