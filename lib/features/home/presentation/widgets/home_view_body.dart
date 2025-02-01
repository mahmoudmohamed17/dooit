import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/home_screens_page_view.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/navigation_buttons_widget.dart';

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
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentIndex = controller.page!.round();
      });
    });
    super.initState();
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
            const CustomAppBar(),
            verticalSpace(42),
            NavigationButtonsWidget(
              activeIndex: currentIndex,
              controller: controller,
            ),
            Expanded(child: HomeScreensPageView(controller: controller)),
          ],
        ),
      ),
    );
  }
}
