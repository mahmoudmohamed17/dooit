import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/empty_pinned_lists_body.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/filled_pinned_list.dart';

class PinnedListsViewBody extends StatelessWidget {
  const PinnedListsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinnedCubit, PinnedState>(
      builder: (context, state) {
        if (state is PinnedInitial) {
          return const EmptyPinnedListsBody();
        } else if (state is PinnedFilled) {
          return FilledPinnedList(list: state.pinnedCategories);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
