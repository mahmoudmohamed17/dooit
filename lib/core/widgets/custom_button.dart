import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed, this.color, this.textColor});
  final String label;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.secondaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          label,
          style: AppStyles.medium16.copyWith(color: textColor ?? AppColors.primaryColor),
        ));
  }
}
