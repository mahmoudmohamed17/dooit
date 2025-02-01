import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.isActive,
    required this.text,
  });
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.primaryColor : AppColors.unselectedBadgeColor,
        borderRadius: BorderRadius.circular(navigationButtonRadius),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppStyles.medium16.copyWith(
            color: isActive
                ? AppColors.secondaryColor
                : AppColors.unselectedTextBadgeColor),
      ),
    );
  }
}
