import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:full_ecommerce_app/features/auth/presentation/refactors/signup_body.dart';
import 'package:full_ecommerce_app/features/auth/presentation/widgets/bottom_shape.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CustomPaint(
        size: Size(double.infinity, 50.h),
        painter: AuthBottomCustomPainter(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkLight,
                    DarkColors.bluePinkDark,
                  ]
                : [
                    LightColors.bluePinkLight,
                    LightColors.bluePinkLight,
                    LightColors.bluePinkLight,
                    LightColors.bluePinkDark,
                  ],
          ),
        ),
      ),
      body:  SafeArea(
          child: BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignupBody(),
      ),),
    );
  }
}
