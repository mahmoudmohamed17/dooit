import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';

class EmptySearchBody extends StatelessWidget {
  const EmptySearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesNoResults,
            height: context.height * 0.32,
            width: context.width * 0.32,
          ),
          const Text(
            'Sorry, we couldn\'t find any matching results!',
            textAlign: TextAlign.center,
            style: AppStyles.semibold16,
          ),
          verticalSpace(120),
        ],
      ),
    );
  }
}
