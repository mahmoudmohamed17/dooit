import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/task_model.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/update_task_bottom_sheet.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.task, required this.category});
  final TaskModel task;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () async {
              if (task.isChecked) {
                context.read<CategoryCubit>().updateTask(category.id, task.id,
                    isChecked: !task.isChecked);
              } else {
                context.read<CategoryCubit>().updateTask(category.id, task.id,
                    isChecked: !task.isChecked);
              }
              await Future.wait([
                context.read<HomeCubit>().getCategoriesWithTask(),
                context.read<PinnedCubit>().getPinnedCategoriesWithTasks(),
              ]);
            },
            child: task.isChecked
                ? const Icon(FontAwesomeIcons.solidSquareCheck)
                : const Icon(FontAwesomeIcons.squareCheck)),
        GestureDetector(
          onTap: () {
            updateTaskBottomSheet(context, category, task);
          },
          child: SizedBox(
            width: context.width * 0.7,
            child: Text(
              task.title,
              style: AppStyles.regular14.copyWith(
                  decoration:
                      task.isChecked ? TextDecoration.lineThrough : null,
                  decorationThickness: 1.5),
              maxLines: 5,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            context
                .read<CategoryCubit>()
                .deleteTask(taskId: task.id, category: category);
            await Future.wait([
              context.read<HomeCubit>().getCategoriesWithTask(),
              context.read<PinnedCubit>().getPinnedCategoriesWithTasks(),
            ]);
          },
          child: const Icon(
            Icons.delete,
            size: 18,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
