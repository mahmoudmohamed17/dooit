import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/pin_widget.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';

class CategoryDetailsAppBar extends StatelessWidget {
  const CategoryDetailsAppBar({
    super.key,
    required this.category,
  });
  final CategoriesTableData category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
            PinWidget(
              isPinned: category.isPinned,
              onTap: (value) {
                context
                    .read<HomeCubit>()
                    .updateCategory(category.id, isPinned: value);
              },
            ),
          ],
        );
      },
    );
  }
}
