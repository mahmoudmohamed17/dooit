import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';
import 'package:to_do_list_app/core/widgets/custom_button.dart';

class EmptyPinnedListsBody extends StatelessWidget {
  const EmptyPinnedListsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        SvgPicture.asset(Assets.imagesSearch, height: context.height * 0.28),
        const Text(
          'Ooops! No pinned list yet...',
          style: AppStyles.semibold20,
        ),
        CustomButton(
          label: '+ New List',
          onPressed: () {},
        ),
      ],
    );
  }
}