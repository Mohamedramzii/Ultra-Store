import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/images/app_images.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
      builder: (context, state) {
        return FadeInDownBig(
          duration: const Duration(milliseconds: animationDuration),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.w),
                  child: BlocProvider.of<AppCubit>(context).image == null
                      ? GestureDetector(
                          onTap: () =>
                              BlocProvider.of<AppCubit>(context).uploadImage(),
                          child: Stack(
                            children: [
                              Image.asset(
                                AppImages.userAvatar,
                                width: 100.w,
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  child: const Icon(Icons.add_a_photo),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          BlocProvider.of<AppCubit>(context).image!,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (context.read<AppCubit>().image == null)
                Text(
                  '${context.translate(LangKeys.addPhoto)}*',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.red),
                )
            ],
          ),
        );
      },
    );
  }
}
