import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';

class RotatingIconWidget extends StatelessWidget {
  const RotatingIconWidget({
    super.key,
    required this.angle,
  });
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: const Icon(
        Icons.arrow_back_ios,
        size: 18,
        color: AppColors.primaryColor,
      ),
    );
  }
}
