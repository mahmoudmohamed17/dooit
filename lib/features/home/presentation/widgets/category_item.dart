import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/lists.dart';
import 'package:to_do_list_app/features/category_details/presentation/views/category_details_view.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/date_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryWithTasks});
  final CategoryWithTasks categoryWithTasks;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(CategoryDetailsView.id,);
      },
      child: Container(
        decoration: BoxDecoration(
          color: labelColor[categoryWithTasks.category.label],
          borderRadius: BorderRadius.circular(categoryItemRadius),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            SizedBox(
              width: context.width * 0.77,
              child: Text(
                categoryWithTasks.category.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.medium20,
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(labelRadius),
                    color: AppColors.primaryColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    categoryWithTasks.category.label,
                    style: AppStyles.medium8
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
                DateWidget(
                  date: categoryWithTasks.category.date,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
