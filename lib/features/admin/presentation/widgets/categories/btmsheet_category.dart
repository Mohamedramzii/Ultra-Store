// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class CategoryBTMsheet {
  const CategoryBTMsheet._();

  static Future<dynamic> AddCategoryBtmSheet(
    BuildContext context,
    TextTheme textTheme,
  ) {
    return showModalBottomSheet(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      backgroundColor: context.isDarkMode
          ? DarkColors.bluePinkDark
          : LightColors.bluePinkLight,
      context: context,
      builder: (contexxt) => BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            width: double.infinity,
            child: Form(
              key: BlocProvider.of<AdminCubit>(context).formKey,
              child: Column(
                children: [
                  Text(
                    context.translate(LangKeys.addcategory),
                    style: textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.translate(LangKeys.addcategoryPhoto),
                      style: textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<AdminCubit, AdminState>(
                    builder: (context, state) {
                      var cubit = BlocProvider.of<AdminCubit>(context);
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).pickImage();
                        },
                        child: Container(
                          width:
                              BlocProvider.of<AppCubit>(context).image == null
                                  ? double.infinity
                                  : 150.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: BlocProvider.of<AppCubit>(context).image ==
                                    null
                                ? Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.white,
                                    size: 40.r,
                                  )
                                : Image.file(
                                    BlocProvider.of<AppCubit>(context).image!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.translate(LangKeys.addcategoryName),
                      style: textTheme.displaySmall,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    controller:
                        BlocProvider.of<AdminCubit>(context).categoryName,
                    keyboardType: TextInputType.name,
                    filled: true,
                    fillColour: Colors.grey,
                    hintText: context.translate(LangKeys.addcategoryName),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid Category Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MaterialButton(
                    height: 60.h,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    minWidth: double.infinity,
                    onPressed: () {
                      if (BlocProvider.of<AdminCubit>(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        Navigator.of(context).pop(true);
                        BlocProvider.of<AdminCubit>(context).createNewCategory(
                            categoryName: BlocProvider.of<AdminCubit>(context)
                                .categoryName
                                .text);
                      }
                    },
                    color: context.isDarkMode
                        ? DarkColors.navBarbg
                        : LightColors.navBarbg,
                    child: Text(
                      context.translate(LangKeys.createcategory),
                      style: textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Future<dynamic> UpdateCategoryBtmSheet(
    BuildContext context,
    TextTheme textTheme,
  ) {
    return showModalBottomSheet(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      backgroundColor: context.isDarkMode
          ? DarkColors.bluePinkDark
          : LightColors.bluePinkLight,
      context: context,
      builder: (contexxt) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              context.translate(LangKeys.updatecategory),
              style: textTheme.displayMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.translate(LangKeys.updatecategoryPhoto),
                style: textTheme.displaySmall,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 40.r,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                context.translate(LangKeys.updatecategoryName),
                style: textTheme.displaySmall,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              filled: true,
              fillColour: Colors.grey,
              hintText: context.translate(LangKeys.updatecategoryName),
              validator: (p0) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            MaterialButton(
              height: 60.h,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).pop(true);
                BlocProvider.of<AdminCubit>(context).getAllCategories();
              },
              color: context.isDarkMode
                  ? DarkColors.navBarbg
                  : LightColors.navBarbg,
              child: Text(
                context.translate(LangKeys.updatecategory),
                style: textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
