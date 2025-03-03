import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_item.dart';

class FilledListBody extends StatelessWidget {
  const FilledListBody({super.key, required this.list});
  final List<CategoryWithTasks> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(list[index].category.id),
          direction: DismissDirection.horizontal,
          background: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xffE3735E),
              borderRadius: BorderRadius.circular(categoryItemRadius),
            ),
            alignment: Alignment.center,
            child: Text(
              'Remove',
              style: AppStyles.medium16.copyWith(color: Colors.black),
            ),
          ),
          onDismissed: (direction) {
            context
                .read<HomeCubit>()
                .deleteCategory(categoryWithTasks: list[index]);
            context
                .read<PinnedCubit>()
                .deleteFromPinned(categoryWithTasks: list[index]);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: CategoryItem(
              categoryWithTasks: list[index],
            ),
          ),
        );
      },
    );
  }
}
