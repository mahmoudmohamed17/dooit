import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/utils/lists.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/label_widget.dart';

class CategoryLabelsListWidget extends StatefulWidget {
  const CategoryLabelsListWidget({super.key, required this.category, this.onTap});
  final CategoryModel category;
  final Function(String)? onTap;

  @override
  State<CategoryLabelsListWidget> createState() => _CategoryLabelsListWidgetState();
}

class _CategoryLabelsListWidgetState extends State<CategoryLabelsListWidget> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = labels.indexOf(widget.category.label);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            widget.onTap?.call(labels[index]);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: LabelWidget(
              isActive: currentIndex == index,
              label: labels[index],
            ),
          ),
        );
      }),
    );
  }
}