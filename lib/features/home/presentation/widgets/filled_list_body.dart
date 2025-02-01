import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_item.dart';

class FilledListBody extends StatelessWidget {
  const FilledListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        verticalSpace(50),
        CategoryItem(),
      ],
    );
  }
}