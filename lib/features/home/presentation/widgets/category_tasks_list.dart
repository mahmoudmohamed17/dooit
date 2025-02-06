import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/task_item.dart';

class CategoryTasksList extends StatelessWidget {
  const CategoryTasksList({super.key, required this.tasks});
  final List<TasksTableData> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks
          .map((tasks) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TaskItem(isChecked: tasks.isChecked, title: tasks.title),
              ))
          .toList(),
    );
  }
}
