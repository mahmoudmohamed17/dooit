import 'package:to_do_list_app/core/services/app_database.dart';

// to handle the data coming from the database as one entity
class CategoryWithTasks {
  final CategoriesTableData category;
  final List<TasksTableData> tasks;

  CategoryWithTasks({required this.category, required this.tasks});
}
