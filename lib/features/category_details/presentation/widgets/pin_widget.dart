import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class PinWidget extends StatefulWidget {
  const PinWidget({super.key, required this.onTap, required this.isPinned});
  final Function(bool) onTap;
  final bool isPinned;

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    isActive = widget.isPinned;
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        widget.onTap.call(isActive);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(labelRadius),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
            color:
                isActive ? AppColors.primaryColor : AppColors.secondaryColor),
        padding: const EdgeInsets.all(6),
        child: Row(
          spacing: 4,
          children: [
            const Icon(
              FontAwesomeIcons.mapPin,
              size: 16,
            ),
            Text(
              isActive ? 'Pinned' : 'Pin',
              style: AppStyles.medium10,
            )
          ],
        ),
      ),
    );
  }
}
