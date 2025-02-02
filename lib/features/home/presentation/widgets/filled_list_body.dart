import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_item.dart';

class FilledListBody extends StatelessWidget {
  const FilledListBody({super.key, required this.list});
  final List<CategoryWithTasks> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          categoryWithTasks: list[index],
        );
      },
    );
  }
}
