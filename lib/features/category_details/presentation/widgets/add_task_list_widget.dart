import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/add_task_text_field.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';

class AddTaskListWidget extends StatefulWidget {
  const AddTaskListWidget({super.key, required this.category});
  final CategoriesTableData category;

  @override
  State<AddTaskListWidget> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<AddTaskListWidget> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        GestureDetector(
          child: const Icon(
            FontAwesomeIcons.squarePlus,
          ),
        ),
        Expanded(
          child: AddTaskTextField(
            onTap: () {
              context
                  .read<CategoryCubit>()
                  .addTask(title: title, category: widget.category);
              context.read<PinnedCubit>().getPinnedCategoriesWithTasks();
            },
            onChanged: (value) {
              title = value;
            },
          ),
        ),
      ],
    );
  }
}
