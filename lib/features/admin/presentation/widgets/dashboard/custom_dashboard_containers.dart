import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/common/widgets/loading_shimmer.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    required this.cubit,
    required this.state,
    required this.title,
    required this.total,
    required this.image,
    super.key,
  });

  final AdminCubit cubit;
  final AdminState state;
  final String title;
  final int total;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              colors: context.isLightMode
                  ? [
                      LightColors.containerLinear1,
                      Colors.white,
                    ]
                  : [
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
                    if (state is! AdminGetAllProductsSuccessState &&
                        state is! AdminGetAllCategoriesSuccessState &&
                        state is! AdminGetAllUsersSuccessState)
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
      ),
    );
  }
}
