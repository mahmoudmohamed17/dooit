import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_details_view_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.categoryWithTasks});
  static const String id = Routes.categoryDetailsView;
  final CategoryWithTasks categoryWithTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: CategoryDetailsViewBody(
        categoryWithTasks: categoryWithTasks,
      ),
    );
  }
}
