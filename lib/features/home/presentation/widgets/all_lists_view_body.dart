import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/empty_all_lists_body.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/filled_list_body.dart';

class AllListsViewBody extends StatelessWidget {
  const AllListsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return const EmptyAllListsBody();
        } else if (state is HomeFilled) {
          return  Expanded(child: FilledListBody(list: state.categoriesWithTasks,));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
