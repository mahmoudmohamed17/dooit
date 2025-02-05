import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_item.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key, required this.matchQuery, required this.query});
  final List<CategoryWithTasks> matchQuery;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      verticalSpace(8),
       query.isEmpty ? const SizedBox() : Text(
          'Results(${matchQuery.length})',
          style: AppStyles.regular16,
        ),
        verticalSpace(16),
        Expanded(
          child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: CategoryItem(categoryWithTasks: matchQuery[index]),
                );
              }),
        ),
      ],
    );
  }
}
