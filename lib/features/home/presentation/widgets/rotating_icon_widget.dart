import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';

class RotatingIconWidget extends StatelessWidget {
  const RotatingIconWidget({
    super.key,
    required this.isRotate,
  });
  final bool isRotate;
 
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isRotate ? 0.5 : 0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
      child: const Icon(
        FontAwesomeIcons.chevronDown,
        size: 18,
        color: AppColors.primaryColor,
      ),
    );
  }
}
