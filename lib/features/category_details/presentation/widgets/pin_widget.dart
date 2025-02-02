import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(labelRadius),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
            color: AppColors.secondaryColor),
        padding: const EdgeInsets.all(6),
        child: const Row(
          spacing: 4,
          children: [
            Icon(
              FontAwesomeIcons.mapPin,
              size: 16,
            ),
            Text(
              'Pinned',
              style: AppStyles.medium10,
            )
          ],
        ),
      ),
    );
  }
}
