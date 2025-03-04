import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/widgets/custom_text_field.dart';
import 'package:to_do_list_app/core/widgets/select_label_widget.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

Future<dynamic> addCategoryButtomSheet(BuildContext context) {
  String? title, label;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: MediaQuery.viewInsetsOf(context).bottom + 24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              mainAxisSize: MainAxisSize.min,
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
                CustomTextField(
                  hintText: 'Title',
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SelectLabelWidget(
                  onTap: (value) {
                    label = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      var time = DateTime.now();
                      var date = '${time.day}-${time.month}-${time.year}';
                      var category = CategoryModel(
                        title: title!,
                        label: label!,
                        date: date,
                      );
                      context
                          .read<HomeCubit>()
                          .addCategory(category: category);
                      // ignore: use_build_context_synchronously
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 0,
                    ),
                    child: Text(
                      'Add',
                      style: AppStyles.medium16
                          .copyWith(color: AppColors.secondaryColor),
                    )),
              ],
            ),
          ),
        );
      });
}
