import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/core/app/app_cubit/app_cubit.dart';
import 'package:full_ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:full_ecommerce_app/features/admin/presentation/refactors/categories_body.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/custom_appbar.dart';
import 'package:full_ecommerce_app/language/lang_keys.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => AdminCubit()..getAllCategories(),
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AdminCubit>(context);
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButton: Container(
              width: 60.w,
              height: 60.w,
              padding: EdgeInsets.all(8.r),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? DarkColors.bluePinkDark
                    : LightColors.bluePinkLight,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
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
                      child: Form(
                        key: cubit.formKey,
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
                            InkWell(
                              onTap: () {
                                BlocProvider.of<AppCubit>(context).pickImage();
                              },
                              child: Container(
                                width:
                                    BlocProvider.of<AppCubit>(context).image ==
                                            null
                                        ? double.infinity
                                        : 150.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: BlocProvider.of<AppCubit>(context)
                                              .image ==
                                          null
                                      ? Icon(
                                          Icons.add_a_photo_outlined,
                                          color: Colors.white,
                                          size: 40.r,
                                        )
                                      : Image.file(
                                          BlocProvider.of<AppCubit>(context)
                                              .image!,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
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
                              controller: BlocProvider.of<AdminCubit>(context)
                                  .categoryName,
                              keyboardType: TextInputType.name,
                              filled: true,
                              fillColour: Colors.grey,
                              hintText:
                                  context.translate(LangKeys.addcategoryName),
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
                                  BlocProvider.of<AdminCubit>(context)
                                      .createNewCategory(
                                          categoryName:
                                              BlocProvider.of<AdminCubit>(
                                                      context)
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
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            appBar: AdminAppBar(
              isMain: true,
              backgroundColor: context.isDarkMode
                  ? DarkColors.mainColor
                  : LightColors.mainColor,
              title: 'Categories',
            ),
            body: const CategoriesScreenBody(),
          );
        },
      ),
    );
  }
}
