import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/navigation_button.dart';

class NavigationButtonsWidget extends StatelessWidget {
  const NavigationButtonsWidget(
      {super.key, required this.activeIndex, required this.controller});
  final int activeIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 12,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.animateToPage(0,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            },
            child: NavigationButton(
              isActive: activeIndex == 0,
              text: 'All Lists',
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.animateToPage(1,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            },
            child: NavigationButton(
              isActive: activeIndex == 1,
              text: 'Pinned',
            ),
          ),
        ),
      ],
    );
  }
}
