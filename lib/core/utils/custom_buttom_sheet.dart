import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/core/widgets/custom_text_field.dart';

Future<dynamic> customButtomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New List',
                      style: AppStyles.semibold20,
                    ),
                  ],
                ),
                verticalSpace(16),
                CustomTextField(
                  hintText: 'Title',
                  onChanged: (value) {},
                ),
                verticalSpace(16),
                
              ],
            ),
          ),
        );
      });
}
