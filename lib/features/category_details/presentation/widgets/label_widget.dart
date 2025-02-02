import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(labelRadius),
        color:
            isActive ? AppColors.primaryColor : AppColors.unselectedLabelColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        'Personal',
        style: AppStyles.medium12.copyWith(color: AppColors.secondaryColor),
      ),
    );
  }
}
