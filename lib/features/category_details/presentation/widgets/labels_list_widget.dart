import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_labels_list_widget.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';

class LabelsListWidget extends StatelessWidget {
  const LabelsListWidget({super.key, required this.category});
  final CategoryModel category;
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
        CategoryLabelsListWidget(
          category: category,
          onTap: (value) async {
            context
                .read<CategoryCubit>()
                .updateCategory(category.id, label: value);
            await Future.wait([
              context.read<HomeCubit>().getCategoriesWithTask(),
              context.read<PinnedCubit>().getPinnedCategoriesWithTasks(),
            ]);
          },
        ),
      ],
    );
  }
}
