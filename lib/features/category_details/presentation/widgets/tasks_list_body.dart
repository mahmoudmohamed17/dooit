import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/tasks_list.dart';

class TasksListBody extends StatelessWidget {
  const TasksListBody({
    super.key,
    required this.categoryWithTasks,
  });
  final CategoryWithTasks categoryWithTasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryUpdate) {
          return TasksList(
            category: categoryWithTasks.category,
            tasks: state.tasks,
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await context.read<CategoryCubit>().addTask(
                          category: categoryWithTasks.category, title: 'hi1');
                    },
                    child: Icon(
                      Icons.add_box_rounded,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
