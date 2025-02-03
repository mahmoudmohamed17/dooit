import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final database = AppDatabase();

  Future<void> addTask(
      {required String title, required CategoriesTableData category}) async {
    await database.addTask(title: title, categoryId: category.id);
    emitCategoryState(category.id);
  }

  Future<void> deleteTask(
      {required int taskId, required CategoriesTableData category}) async {
    await database.deleteTask(taskId: taskId);
    emitCategoryState(category.id);
  }

  Future<List<TasksTableData>> getTasks({required int categoryId}) async {
    List<TasksTableData> tasks =
        await database.getTasksByCategory(categoryId: categoryId);
    log('Category with ID $categoryId have ${tasks.length} of tasks');
    return tasks;
  }

  void emitCategoryState(int categoryId) async {
    var tasks = await getTasks(categoryId: categoryId);
    if (tasks.isEmpty) {
      emit(CategoryInitial());
    } else {
      emit(CategoryUpdate(tasks: tasks));
    }
  }
}
