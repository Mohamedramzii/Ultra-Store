import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/common/widgets/custom_linear_button.dart';
import 'package:full_ecommerce_app/core/common/widgets/show_toast.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/routes/app_routes.dart';
import 'package:full_ecommerce_app/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is UserRegisterSuccessState) {
          ShowToast.showToastSuccessBOTTOM(
              message: context.translate(LangKeys.registeredsuccessfully),
              toastForsuccess: true);
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.customerHomescreen);
        }
      },
      builder: (context, state) {
        if (state is UserRegisterLoadingState &&
            context.read<AppCubit>().image != null) {
          return CustomLinearButton(
            onPressed: () {},
            width: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          );
        } else {
          return CustomLinearButton(
            onPressed: () {
              if (context.read<AuthCubit>().formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).register(
                    email:
                        context.read<AuthCubit>().emailcontroller.text.trim(),
                    password: context
                        .read<AuthCubit>()
                        .passwordcontroller
                        .text
                        .trim(),
                    fullname: context
                        .read<AuthCubit>()
                        .fullnamecontroller
                        .text
                        .trim(),
                    context: context);
              }
            },
            width: double.infinity,
            child: Text(
              context.translate(LangKeys.signUp),
              style: context.textStyle.headlineSmall,
            ),
          );
        }
      },
    );
  }
}
