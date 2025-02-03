import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({super.key, required this.category});
  final CategoriesTableData category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (category.isPinned) {
            } else {}
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(labelRadius),
                  side: const BorderSide(color: AppColors.primaryColor),
                ),
                color: category.isPinned
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor),
            padding: const EdgeInsets.all(6),
            child: Row(
              spacing: 4,
              children: [
                Icon(
                  FontAwesomeIcons.mapPin,
                  size: 16,
                  color: category.isPinned
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor,
                ),
                Text(
                  category.isPinned ? 'Pinned' : 'Pin',
                  style: AppStyles.medium10.copyWith(
                      color: category.isPinned
                          ? AppColors.secondaryColor
                          : AppColors.primaryColor),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
