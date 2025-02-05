import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/empty_search_body.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/search_results_widget.dart';
// Explain of SearchDelegate methods:
// 1. buildActions: Appears at the end of the text field
// usually used to make a clear button to clear the query

// 2. buildLeading: Comes before the text field and usually
// used to pop back to the previous page

// 3. buildResults: To show the return result when user search

// 4. buildSuggestions: Appears before the user start to search
// and changes according to the user input text, then diappears when the
// user confirms his desired search result

class CustomSearchDelegate extends SearchDelegate {
  final List<CategoryWithTasks> list;
  CustomSearchDelegate(this.list);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear, color: AppColors.primaryColor),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CategoryWithTasks> matchQuery = [];
    for (var item in list) {
      if (item.category.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: matchQuery.isEmpty
          ? const EmptySearchBody()
          : SearchResultsWidget(
              matchQuery: matchQuery,
              query: query,
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CategoryWithTasks> matchQuery = [];
    for (var item in list) {
      if (item.category.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: matchQuery.isEmpty
          ? const EmptySearchBody()
          : SearchResultsWidget(
              matchQuery: matchQuery,
              query: query,
            ),
    );
  }
}
