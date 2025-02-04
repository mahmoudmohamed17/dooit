import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/core/widgets/custom_text_form_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_details_app_bar.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/labels_list_widget.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/tasks_list_body.dart';

class CategoryDetailsViewBody extends StatefulWidget {
  const CategoryDetailsViewBody({
    super.key,
    required this.categoryWithTasks,
  });
  final CategoryWithTasks categoryWithTasks;

  @override
  State<CategoryDetailsViewBody> createState() =>
      _CategoryDetailsViewBodyState();
}

class _CategoryDetailsViewBodyState extends State<CategoryDetailsViewBody> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            CategoryDetailsAppBar(
              category: widget.categoryWithTasks.category,
            ),
            verticalSpace(24),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    initialValue: widget.categoryWithTasks.category.title,
                    hintText: 'Title',
                    fontWeight: AppStyles.semibold24.fontWeight,
                    fontSize: 24,
                    onTap: () {
                      context.read<CategoryCubit>().updateCategory(
                          widget.categoryWithTasks.category.id,
                          title: title);
                      log('This is done!');
                    },
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                ),
              ],
            ),
            Expanded(
                child: TasksListBody(
              categoryWithTasks: widget.categoryWithTasks,
            )),
            verticalSpace(8),
            const Divider(),
            verticalSpace(16),
            LabelsListWidget(
              category: widget.categoryWithTasks.category,
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
