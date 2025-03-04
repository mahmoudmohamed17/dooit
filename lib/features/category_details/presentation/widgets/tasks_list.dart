import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/task_model.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/add_task_list_widget.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/task_list_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.category,
  });
  final List<TaskModel> tasks;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          spacing: 12,
          children: List.generate(tasks.length, (index) {
            return TaskListItem(task: tasks[index], category: category);
          }),
        ),
        verticalSpace(12),
        AddTaskListWidget(category: category),
      ],
    );
  }
}
