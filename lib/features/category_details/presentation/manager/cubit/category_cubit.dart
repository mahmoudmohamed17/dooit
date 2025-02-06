import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final database = getIt.get<AppDatabase>();

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
    return tasks;
  }

  void updateCategory(int categoryId,
      {String? title, String? label, bool? isPinned}) {
    database.updateCategory(categoryId,
        title: title, label: label, isPinned: isPinned);
  }

  void updateTask(int categoryId, int taskId,
      {String? title, bool? isChecked}) {
    log('The new checkbox value is $isChecked');
    log('The new title value is $title');

    database.updateTask(taskId, title: title, isChecked: isChecked);
    emitCategoryState(categoryId);
  }

  Future<CategoryWithTasks> loadCategoryData({required int id}) async {
    return await database.getCategoryWithTasks(id: id);
  }

  void emitCategoryState(int categoryId) async {
    var category = await loadCategoryData(id: categoryId);
    if (category.tasks.isEmpty) {
      emit(CategoryInitial());
    } else {
      emit(CategoryUpdate(categoryWithTasks: category));
    }
  }

  void resetState() {
    emit(CategoryLaoding());
  }
}
