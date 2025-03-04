import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/task_model.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/task_home_item.dart';

class CategoryTasksList extends StatelessWidget {
  const CategoryTasksList({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks
          .map((tasks) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TaskHomeItem(isChecked: tasks.isChecked, title: tasks.title),
              ))
          .toList(),
    );
  }
}
