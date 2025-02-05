import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/widgets/custom_text_form_field.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';

class CategoryTitleWidget extends StatefulWidget {
  const CategoryTitleWidget({super.key, required this.categoryWithTasks});
  final CategoryWithTasks categoryWithTasks;

  @override
  State<CategoryTitleWidget> createState() => _CategoryTitleWidgetState();
}

class _CategoryTitleWidgetState extends State<CategoryTitleWidget> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            initialValue: widget.categoryWithTasks.category.title,
            hintText: 'Title',
            fontWeight: AppStyles.semibold24.fontWeight,
            fontSize: 24,
            onTap: () {
              context.read<CategoryCubit>().updateCategory(
                  widget.categoryWithTasks.category.id,
                  title: title);
              context.read<HomeCubit>().getCategoriesWithTask();
            },
            onChanged: (value) {
              title = value;
            },
          ),
        ),
      ],
    );
  }
}
