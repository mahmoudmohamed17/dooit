import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/all_lists_view_body.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/home_screens_page_view.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/pinned_lists_view_body.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(16),
            const HomeAppBar(),
            verticalSpace(42),
            ToggleSwitch(
              minWidth: 200.00,
              cornerRadius: navigationButtonRadius,
              activeBgColors: const [
                [Colors.black],
                [Colors.black],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: AppColors.unselectedBadgeColor,
              inactiveFgColor: AppColors.unselectedTextBadgeColor,
              fontSize: 16.00,
              initialLabelIndex: currentIndex,
              totalSwitches: 2,
              labels: const ['All List', 'Pinned'],
              radiusStyle: true,
              animate:  true,
              animationDuration: 200,
              onToggle: (index) {
                controller.animateToPage(index!,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut);
              },
            ),
            verticalSpace(32),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  if (index != currentIndex) {
                    setState(() {
                      currentIndex = index;
                    });
                  }
                },
                children: const [
                  AllListsViewBody(),
                  PinnedListsViewBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
