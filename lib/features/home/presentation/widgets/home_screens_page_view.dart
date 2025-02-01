import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/all_lists_view_body.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/pinned_lists_view_body.dart';

class HomeScreensPageView extends StatelessWidget {
  const HomeScreensPageView({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const [
        AllListsViewBody(),
        PinnedListsViewBody(),
      ],
    );
  }
}