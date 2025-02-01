import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';
import 'package:to_do_list_app/core/widgets/custom_button.dart';

class EmptyAllListsBody extends StatelessWidget {
  const EmptyAllListsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        SvgPicture.asset(Assets.imagesCreateToDo, height: context.height * 0.4),
        const Text(
          'Create your first To-Do list...',
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
