import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/pinned_cubit/pinned_cubit.dart';

class PinWidget extends StatefulWidget {
  const PinWidget({super.key, required this.categoryWithTasks});
  final CategoryWithTasks categoryWithTasks;

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  late bool isPinned;
  @override
  void initState() {
    isPinned = widget.categoryWithTasks.category.isPinned;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isPinned) {
            isPinned = !isPinned;
            context
                .read<PinnedCubit>()
                .deleteFromPinned(categoryWithTasks: widget.categoryWithTasks);
            context.read<HomeCubit>().getCategoriesWithTask();
          } else {
            isPinned = !isPinned;
            context
                .read<PinnedCubit>()
                .addToPinned(categoryWithTasks: widget.categoryWithTasks);
            context.read<HomeCubit>().getCategoriesWithTask();
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(labelRadius),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
            color:
                isPinned ? AppColors.primaryColor : AppColors.secondaryColor),
        padding: const EdgeInsets.all(6),
        child: Row(
          spacing: 4,
          children: [
            Icon(
              FontAwesomeIcons.mapPin,
              size: 16,
              color:
                  isPinned ? AppColors.secondaryColor : AppColors.primaryColor,
            ),
            Text(
              isPinned ? 'Pinned' : 'Pin',
              style: AppStyles.medium10.copyWith(
                  color: isPinned
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
