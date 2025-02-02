import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/lists.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/label_widget.dart';

class SelectLabelWidget extends StatefulWidget {
  const SelectLabelWidget({
    super.key,
    this.onTap,
  });

  final Function(String)? onTap;

  @override
  State<SelectLabelWidget> createState() => _SelectLabelWidgetState();
}

class _SelectLabelWidgetState extends State<SelectLabelWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labeles.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            widget.onTap ?? (labeles[index]);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: LabelWidget(
              isActive: currentIndex == index,
            ),
          ),
        );
      }),
    );
  }
}
