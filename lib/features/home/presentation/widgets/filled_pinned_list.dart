import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/pinned_cubit/pinned_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_item.dart';

class FilledPinnedList extends StatelessWidget {
  const FilledPinnedList({super.key, required this.list});
  final List<CategoryWithTasks> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: (value) {
                context
                    .read<PinnedCubit>()
                    .deleteFromPinned(categoryWithTasks: list[index]);
                context.read<HomeCubit>().getCategoriesWithTask();
              },
              icon: Icons.delete,
              label: 'Delete',
              backgroundColor: Colors.red,
            )
          ]),
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
