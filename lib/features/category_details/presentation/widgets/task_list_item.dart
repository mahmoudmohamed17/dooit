import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/widgets/custom_text_form_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';

class TaskListItem extends StatefulWidget {
  const TaskListItem({super.key, required this.task, required this.category});
  final TasksTableData task;
  final CategoriesTableData category;

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        GestureDetector(
            onTap: () {
              if (widget.task.isChecked) {
                context.read<CategoryCubit>().updateTask(
                    widget.category.id, widget.task.id,
                    isChecked: !widget.task.isChecked);
              } else {
                context.read<CategoryCubit>().updateTask(
                    widget.category.id, widget.task.id,
                    isChecked: !widget.task.isChecked);
              }
            },
            child: widget.task.isChecked
                ? const Icon(FontAwesomeIcons.solidSquareCheck)
                : const Icon(FontAwesomeIcons.squareCheck)),
        Expanded(
          flex: 7,
          child: CustomTextFormField(
            initialValue: widget.task.title,
            hintText: 'To-Do',
            isChecked: widget.task.isChecked,
            onTap: () {
              context
                  .read<CategoryCubit>()
                  .updateTask(widget.category.id, widget.task.id, title: title);
            },
            onChanged: (value) {
              title = value;
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            context
                .read<CategoryCubit>()
                .deleteTask(taskId: widget.task.id, category: widget.category);
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
