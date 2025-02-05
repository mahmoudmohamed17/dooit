import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/widgets/custom_text_form_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.category,
  });
  final List<TasksTableData> tasks;
  final CategoriesTableData category;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.tasks
          .map((task) => Container(
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                ),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  spacing: 8,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (task.isChecked) {
                            context.read<CategoryCubit>().updateTask(
                                widget.category.id, task.id,
                                isChecked: !task.isChecked);
                          } else {
                            context.read<CategoryCubit>().updateTask(
                                widget.category.id, task.id,
                                isChecked: !task.isChecked);
                          }
                          context.read<HomeCubit>().getCategoriesWithTask();
                        },
                        child: task.isChecked
                            ? const Icon(FontAwesomeIcons.solidSquareCheck)
                            : const Icon(FontAwesomeIcons.squareCheck)),
                    Expanded(
                      child: CustomTextFormField(
                        initialValue: task.title,
                        hintText: 'To-Do',
                        isChecked: task.isChecked,
                        onTap: () {
                          context.read<CategoryCubit>().updateTask(
                              widget.category.id, task.categoryId,
                              title: title);
                          context.read<HomeCubit>().getCategoriesWithTask();
                        },
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                    ),
                  ],
                ),
              ))
          .followedBy([
        // add new task
        Container(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
          ),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            spacing: 5,
            children: [
              GestureDetector(
                onTap: () async {},
                child: const Icon(
                  FontAwesomeIcons.squarePlus,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'To-Do',
                  onTap: () {
                    context
                        .read<CategoryCubit>()
                        .addTask(title: title, category: widget.category);
                    context.read<HomeCubit>().getCategoriesWithTask();
                  },
                  onChanged: (value) {
                    title = value;
                  },
                ),
              ),
            ],
          ),
        )
      ]).toList(),
    );
  }
}
