import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/date_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.personalLabelColor,
        borderRadius: BorderRadius.circular(categoryItemRadius),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SizedBox(
            width: context.width * 0.77,
            child: const Text(
              'Daily To-do’s',
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
                  'Personal',
                  style: AppStyles.medium8
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ),
              const DateWidget(),
            ],
          )
        ],
      ),
    );
  }
}
