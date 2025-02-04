import 'dart:developer';

import 'package:bloc/bloc.dart';
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
    emitCategoryState(categoryId);
  }

  void updateTask(int categoryId, int taskId,
      {String? title, bool? isChecked}) {
    database.updateTask(taskId, title: title, isChecked: isChecked);
    emitCategoryState(categoryId);
  }

  void emitCategoryState(int categoryId) async {
    var tasks = await getTasks(categoryId: categoryId);
    log('Get tasks of category $categoryId\nAre: $tasks');
    if (tasks.isEmpty) {
      emit(CategoryInitial());
    } else {
      emit(CategoryUpdate(tasks: List.from(tasks)));
    }
  }

  void resetState() {
    emit(CategoryLaoding());
  }
}
