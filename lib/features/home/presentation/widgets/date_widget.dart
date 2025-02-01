import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        SvgPicture.asset(
          Assets.imagesCalendar,
          height: 15,
          width: 15,
        ),
        const Text(
          '12-5-2024',
          style: AppStyles.regular8,
        )
      ],
    );
  }
}
