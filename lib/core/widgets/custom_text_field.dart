import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onFieldSubmitted,
    this.onChanged,
  });
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.regular16.copyWith(color: AppColors.primaryColor),
        fillColor: AppColors.borderFillColor,
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: AppColors.borderSideColor));
}
