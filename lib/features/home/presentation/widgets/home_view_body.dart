import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/constants.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/app_logo_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SafeArea(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogoWidget(),
                IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}