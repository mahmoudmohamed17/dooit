import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.isChecked, required this.title});
  final bool isChecked;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        isChecked
            ? const Icon(FontAwesomeIcons.solidSquareCheck)
            : const Icon(FontAwesomeIcons.squareCheck),
        SizedBox(
          width: context.width * 0.70,
          child: Text(
            title,
            style: AppStyles.regular14.copyWith(
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
        ),
      ],
    );
  }
}
