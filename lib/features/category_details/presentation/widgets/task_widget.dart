import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        const Icon(
          Icons.check_box_outline_blank,
        ),
        SizedBox(
          width: context.width * 0.75,
          child: const Text(
            'Stay hydrated',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular14,
          ),
        ),
      ],
    );
  }
}
