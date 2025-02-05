import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/tasks_list.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/tasks_list_empty_body.dart';

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
            tasks: state.categoryWithTasks.tasks,
          );
        } else {
          return TasksListEmptyBody(
            category: categoryWithTasks.category,
          );
        }
      },
    );
  }
}
