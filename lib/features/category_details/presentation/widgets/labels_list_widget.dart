import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/category_details/presentation/widgets/category_labels_list_widget.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

class LabelsListWidget extends StatelessWidget {
  const LabelsListWidget({super.key, required this.category});
  final CategoriesTableData category;
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
          onTap: (value) {
            context
                .read<CategoryCubit>()
                .updateCategory(category.id, label: value);
            context.read<HomeCubit>().getCategoriesWithTask();
          },
        ),
      ],
    );
  }
}
