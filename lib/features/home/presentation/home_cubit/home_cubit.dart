import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final database = AppDatabase();
  List<CategoryWithTasks> categoriesWithTasks = [];

  Future<CategoriesTableData> addCategory(
      {required String title,
      required String date,
      required String label}) async {
    emit(HomeLoading());
    var category =
        await database.addCategory(title: title, label: label, date: date);
    fetchCategoriesWithTask();
    return category;
  }

  Future<void> deleteCategory({required int categoryId}) async {
    emit(HomeLoading());
    await database.deleteCategory(categoryId: categoryId);
    fetchCategoriesWithTask();
  }

  Future<void> addTask({required String title, required int categoryId}) async {
    await database.addTask(title: title, categoryId: categoryId);
    fetchCategoriesWithTask();
  }

  Future<void> deleteTask({required int taskId}) async {
    await database.deleteTask(taskId: taskId);
    fetchCategoriesWithTask();
  }

  Future<void> updateCategory(int categoryId,
      {String? title, String? label, bool? isPinned}) async {
    await database.updateCategory(categoryId,
        title: title, label: label, isPinned: isPinned);
    fetchCategoriesWithTask();
  }

  Future<void> updateTask(int taskId, {String? title, bool? isChecked}) async {
    await database.updateTask(taskId, title: title, isChecked: isChecked);
    fetchCategoriesWithTask();
  }

  Future<void> fetchCategoriesWithTask() async {
    emit(HomeLoading());
    categoriesWithTasks = await database.getCategoriesWithTasks();
    emitHomeState();
  }

  void emitHomeState() {
    if (categoriesWithTasks.isEmpty) {
      emit(HomeInitial());
    } else {
      emit(HomeFilled(
          categoriesWithTasks: List.unmodifiable(categoriesWithTasks)));
    }
  }
}
