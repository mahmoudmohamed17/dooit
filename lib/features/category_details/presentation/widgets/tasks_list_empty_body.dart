import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/widgets/custom_text_form_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

class TasksListEmptyBody extends StatefulWidget {
  const TasksListEmptyBody({
    super.key,
    required this.category,
  });

  final CategoriesTableData category;

  @override
  State<TasksListEmptyBody> createState() => _TasksListEmptyBodyState();
}

class _TasksListEmptyBodyState extends State<TasksListEmptyBody> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            const Icon(
              FontAwesomeIcons.squarePlus,
            ),
            Expanded(
              child: CustomTextFormField(
                hintText: 'To-Do',
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .addTask(category: widget.category, title: title);
                  context.read<HomeCubit>().getCategoriesWithTask();
                },
                onChanged: (value) {
                  title = value;
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
