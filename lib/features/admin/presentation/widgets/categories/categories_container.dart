import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';

class CategoriesContainer extends StatelessWidget {
  CategoriesContainer({
    // required this.cubit,
    // required this.state,
    required this.title,
    required this.image,
    super.key,
  });

  // final AdminCubit cubit;
  // final AdminState state;
  final String title;

  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.r),
      child: Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Container(
          height: 135.h,
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
            padding: EdgeInsets.only(
              left: 20.w,
              // top: 25.h,
              // bottom: 25.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
                // CachedNetworkImage(
                //   height: 130.h,
                //   width: 150.w,
                //   errorWidget: (context, url, error) {
                //     try {
                //       if (error is Exception ||
                //           url == 'https://placeimg.com/640/480/any') {
                //         log('DAAAAAAAAAAAAMN IMAGE');
                //         return const Icon(Icons.error);
                //       } else {
                //         // Handle other errors
                //         return const Text('Error loading image');
                //       }
                //     } catch (e) {
                //       return const Text('Error loading image');
                //     }
                //   },
                //   // placeholder: (context, url) =>
                //   //     const CircularProgressIndicator(),
                //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                //       Center(
                //     child: CircularProgressIndicator(
                //       value: downloadProgress.progress,
                //     ),
                //   ),
                //   // errorListener: (e) {
                //   //   if (e is SocketException) {
                //   //     image = 'https://i.imgur.com/BG8J0Fj.jpg';
                //   //   } else {
                //   //     debugPrint('Image Exception is: ${e.runtimeType}');
                //   //   }
                //   // },
                //   // imageBuilder: (context, imageProvider) {
                //   //   return Container(
                //   //     alignment: Alignment.center,
                //   //     height: 130.h,
                //   //     width: 150.w,
                //   //     decoration: BoxDecoration(
                //   //       borderRadius: BorderRadius.circular(20.r),
                //   //       image: DecorationImage(
                //   //         image: imageProvider,
                //   //         fit: BoxFit.cover,
                //   //       ),
                //   //     ),
                //   //   );
                //   // },
                //   // fit: BoxFit.cover,
                //   imageUrl: image,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
