import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NavigationButtonsWidget extends StatefulWidget {
  const NavigationButtonsWidget(
      {super.key, required this.activeIndex, required this.controller});
  final int activeIndex;
  final PageController controller;

  @override
  State<NavigationButtonsWidget> createState() =>
      _NavigationButtonsWidgetState();
}

class _NavigationButtonsWidgetState extends State<NavigationButtonsWidget> {
  late int _activeIndex;
  @override
  void initState() {
    super.initState();
    _activeIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
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
      animate: true,
      animationDuration: 200,
      initialLabelIndex: _activeIndex,
      totalSwitches: 2,
      labels: const ['All List', 'Pinned'],
      radiusStyle: true,
      onToggle: (index) {
        setState(() {
          _activeIndex = index!;
        });
        widget.controller.animateToPage(_activeIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut);
      },
    );
  }
}
