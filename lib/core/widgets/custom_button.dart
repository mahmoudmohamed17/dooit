import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          label,
          style: AppStyles.medium16.copyWith(color: AppColors.primaryColor),
        ));
  }
}
