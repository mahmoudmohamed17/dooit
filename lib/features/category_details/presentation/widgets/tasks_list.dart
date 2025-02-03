import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks, required this.category});
  final List<TasksTableData> tasks;
  final CategoriesTableData category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks
          .map((task) => Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    const Icon(
                      Icons.check_box_outline_blank,
                    ),
                    SizedBox(
                      width: context.width * 0.75,
                      child: const Text(
                        'Stay hydrated',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular14,
                      ),
                    ),
                  ],
                ),
              ))
          .followedBy([
        Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .addTask(category: category, title: 'next');
                },
                child: Icon(
                  Icons.add_box_outlined,
                ),
              ),
            ],
          ),
        )
      ]).toList(),
    );
  }
}
