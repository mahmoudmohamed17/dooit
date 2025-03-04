import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/task_model.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/widgets/custom_button.dart';
import 'package:to_do_list_app/core/widgets/custom_text_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';

Future<dynamic> updateTaskBottomSheet(
    BuildContext context, CategoryModel category, TaskModel task) {
  String? title;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.viewInsetsOf(context).bottom + 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                TextFormField(
                  style: AppStyles.regular16,
                  initialValue: task.title,
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    hintText: 'To-Do',
                    hintStyle: AppStyles.regular16
                        .copyWith(color: AppColors.subTextColor),
                    focusedBorder: buildBorder(),
                    enabledBorder: buildBorder(),
                  ),
                ),
                CustomButton(
                  label: 'Change',
                  onPressed: () async {
                    context
                        .read<CategoryCubit>()
                        .updateTask(category.id, task.id, title: title ?? '');
                    context.pop();
                    await Future.wait([
                      context.read<HomeCubit>().getCategoriesWithTask(),
                      context
                          .read<PinnedCubit>()
                          .getPinnedCategoriesWithTasks(),
                    ]);
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.secondaryColor,
                )
              ],
            ),
          ),
        );
      });
}
