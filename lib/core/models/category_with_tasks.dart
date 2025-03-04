import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/task_model.dart';

// to handle the data coming from the database as one entity
class CategoryWithTasks {
  final CategoryModel category;
  final List<TaskModel> tasks;

  CategoryWithTasks({required this.category, required this.tasks});
}
