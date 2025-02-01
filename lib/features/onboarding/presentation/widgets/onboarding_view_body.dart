import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/assets.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/core/widgets/custom_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Center(
        child: Column(
          children: [
            Expanded(child: verticalSpace(0)),
            SvgPicture.asset(
              Assets.imagesAppLogo1,
              height: 60,
              width: 60,
            ),
            verticalSpace(16),
             Text(
              'Dooit',
              textAlign: TextAlign.center,
              style: AppStyles.semibold40.copyWith(color: AppColors.secondaryColor),
            ),
            verticalSpace(16),
            Text(
              'Write what you need to do. Everyday.',
              textAlign: TextAlign.center,
              style: AppStyles.medium20.copyWith(color: AppColors.subTextColor),
            ),
            Expanded(child: verticalSpace(0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Continue',
                    onPressed: () {
                      context.pushReplacementNamed(Routes.homeView);
                    },
                  ),
                )
              ],
            ),
            verticalSpace(context.height * 0.05),
          ],
        ),
      ),
    );
  }
}
