import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/pin_widget.dart';

class CategoryDetailsAppBar extends StatelessWidget {
  const CategoryDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        const PinWidget(),
      ],
    );
  }
}
