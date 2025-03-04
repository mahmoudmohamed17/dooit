import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/utils/add_task_buttom_sheet.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class TasksListEmptyBody extends StatelessWidget {
  const TasksListEmptyBody({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addTaskBottomSheet(context, category);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          spacing: 8,
          children: [
            const Icon(
              FontAwesomeIcons.squarePlus,
            ),
            Text('To-Do',
                style: AppStyles.regular16
                    .copyWith(color: AppColors.subTextColor)),
          ],
        ),
      ),
    );
  }
}
