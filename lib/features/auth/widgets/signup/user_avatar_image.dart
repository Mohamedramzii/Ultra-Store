import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/style/images/app_images.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      duration: const Duration(milliseconds: animationDuration),
      child: CircleAvatar(
        radius: 40.r,
        backgroundImage: const AssetImage(AppImages.userAvatar),
      ),
    );
  }
}
