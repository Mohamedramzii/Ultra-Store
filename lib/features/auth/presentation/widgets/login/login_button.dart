// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/common/animations/custom_direction_animation.dart';

// Project imports:
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/common/widgets/show_toast.dart';

import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          return ShowToast.showToastSuccessBOTTOM(
            message: context.translate(LangKeys.loggedSuccessfully),
            toastForsuccess: true,
          );
        } else if (state is UserLoginFailureState) {
          return ShowToast.showToastSuccessBOTTOM(
            message: context.translate(LangKeys.loggedError),
            toastForsuccess: false,
          );
        }
        if (state is GetUserInformationSuccessState) {
          if (state.userRole == 'admin') {
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.adminHomescreen);
          } else {
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.customerHomescreen);
          }
        }
      },
      builder: (context, state) {
        if (state is UserLoginLoadingState ||
            state is GetUserInformationLoadingState) {
          return CustomLinearButton(
            onPressed: () {},
            width: double.infinity,
            height: 50.h,
            child: Center(
              child: CircularProgressIndicator(
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          );
        }
        return CustomFadeInUp(
          child: CustomLinearButton(
            onPressed: () {
              if (context.read<AuthCubit>().formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).login(
                  email: context.read<AuthCubit>().emailcontroller.text.trim(),
                  password:
                      context.read<AuthCubit>().passwordcontroller.text.trim(),
                );
              }
            },
            width: double.infinity,
            height: 50.h,
            child: Text(
              context.translate(LangKeys.login),
              style: context.textStyle.displayMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
