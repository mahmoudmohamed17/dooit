import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SvgPicture.asset(
          Assets.imagesAppLogo2,
          height: 24,
          width: 24,
        ),
        const Text(
          'Dooit',
          style: AppStyles.semibold20,
        )
      ],
    );
  }
}
