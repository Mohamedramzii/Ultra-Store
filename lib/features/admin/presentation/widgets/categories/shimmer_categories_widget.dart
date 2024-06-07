import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/common/widgets/loading_shimmer.dart';

class ShimmerCategoriesWidget extends StatelessWidget {
  const ShimmerCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(18.r),
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: LoadingShimmer(
              height: 90.h,
              width: double.infinity,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 20.h,
      ),
      itemCount: 8,
    );
  }
}
