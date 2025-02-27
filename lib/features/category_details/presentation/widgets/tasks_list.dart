import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/add_task_list_widget.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/task_list_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.category,
  });
  final List<TasksTableData> tasks;
  final CategoriesTableData category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: List.generate(tasks.length, (index) {
            return TaskListItem(task: tasks[index], category: category);
          }),
        ),
        AddTaskListWidget(category: category),
      ],
    );
  }
}
