import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/label_widget.dart';

class LabelsListWidget extends StatelessWidget {
  const LabelsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        const Text(
          'Choose a label',
          style: AppStyles.medium20,
        ),
        Row(
          children: List.generate(4, (index) {
            return const Padding(
              padding: EdgeInsets.only(right: 8),
              child: LabelWidget(),
            );
          }),
        ),
      ],
    );
  }
}
