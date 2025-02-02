import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/widgets/select_label_widget.dart';

class LabelsListWidget extends StatelessWidget {
  const LabelsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'Choose a label',
          style: AppStyles.medium20,
        ),
        SelectLabelWidget(),
      ],
    );
  }
}
