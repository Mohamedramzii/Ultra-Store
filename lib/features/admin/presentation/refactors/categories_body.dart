import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/core/extensions/context_extensions.dart';
import 'package:full_ecommerce_app/core/style/colors/dark_colors.dart';
import 'package:full_ecommerce_app/core/style/colors/light_colors.dart';
import 'package:full_ecommerce_app/features/admin/presentation/bloc/cubit/admin_cubit.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/categories/btmsheet_category.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/categories/categories_container.dart';
import 'package:full_ecommerce_app/features/admin/presentation/widgets/categories/shimmer_categories_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({super.key});

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<AdminCubit>();
        return LiquidPullToRefresh(
          animSpeedFactor: 2.5,
          springAnimationDurationInMilliseconds: 700,
          color: context.isDarkMode
              ? DarkColors.bluePinkDark
              : LightColors.bluePinkLight,
          showChildOpacityTransition: false,
          onRefresh: () {
            cubit.categories = [];

            return cubit.getAllCategories();
          },
          child: state is AdminGetAllCategoriesLoadingState
              ? const ShimmerCategoriesWidget()
              : ListView.builder(
                  itemCount: cubit.categories.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey<int>(cubit.categories[index].id!),
                      background: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                      child: CategoriesContainer(
                        title: cubit.categories[index].name!,
                        image: cubit.categories[index].image!,
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          cubit.categories.removeAt(index);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: context.isDarkMode
                                    ? DarkColors.bluePinkDark
                                    : LightColors.bluePinkLight,
                                title: const Text('Delete'),
                                content: Text(
                                  'Are you sure you want to delete this category ?',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(),
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: context.isDarkMode
                                    ? DarkColors.bluePinkDark
                                    : LightColors.bluePinkLight,
                                title: const Text('Edit'),
                                content: Text(
                                  'Are you sure you want to edit this cart ?',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      var textTheme =
                                          Theme.of(context).textTheme;
                                      Navigator.of(context).pop();
                                      CategoryBTMsheet.UpdateCategoryBtmSheet(
                                        context,
                                        textTheme,
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('No'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
