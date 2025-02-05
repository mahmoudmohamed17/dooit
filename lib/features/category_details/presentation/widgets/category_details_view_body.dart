import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_details_app_bar.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_title_widget.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/labels_list_widget.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/tasks_list_body.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({
    super.key,
    required this.categoryWithTasks,
  });
  final CategoryWithTasks categoryWithTasks;

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
              categoryWithTasks: categoryWithTasks,
            ),
            verticalSpace(24),
            CategoryTitleWidget(categoryWithTasks: categoryWithTasks),
            verticalSpace(8),
            Expanded(
                child: TasksListBody(
              categoryWithTasks: categoryWithTasks,
            )),
            verticalSpace(8),
            const Divider(),
            verticalSpace(16),
            LabelsListWidget(
              category: categoryWithTasks.category,
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
