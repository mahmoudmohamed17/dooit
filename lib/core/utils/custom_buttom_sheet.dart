import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/core/widgets/custom_button.dart';
import 'package:to_do_list_app/core/widgets/custom_text_field.dart';
import 'package:to_do_list_app/core/widgets/select_label_widget.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';

Future<dynamic> customButtomSheet(BuildContext context) {
  String? title, label;
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
                  onChanged: (value) {
                    title = value;
                  },
                ),
                verticalSpace(16),
                SelectLabelWidget(
                  onTap: (value) {
                    label = value;
                  },
                ),
                verticalSpace(16),
                CustomButton(
                  label: 'Add',
                  onPressed: () {
                    var time = DateTime.now();
                    var date = '${time.day}-${time.month}-${time.year}';
                    context.read<HomeCubit>().addCategory(
                        title: title ?? '', date: date, label: label ?? '');
                  },
                ),
                verticalSpace(16),
              ],
            ),
          ),
        );
      });
}
