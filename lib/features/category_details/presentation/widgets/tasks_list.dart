import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/task_widget.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskWidget(),
        TaskWidget(),
        TaskWidget(),
      ],
    );
  }
}
