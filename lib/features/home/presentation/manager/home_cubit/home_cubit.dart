import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getCategoriesWithTask();
  }
  final db = getIt.get<AppDatabase>();
  List<CategoryWithTasks> categoriesWithTasks = [];

  void addCategory({required CategoryModel category}) {
    categoriesWithTasks.add(CategoryWithTasks(category: category, tasks: []));
    emitHomeState();
  }

  void deleteCategory({required CategoryWithTasks categoryWithTasks}) {
    categoriesWithTasks.remove(categoryWithTasks);
    emitHomeState();
  }

  Future<void> addToDatabase({required CategoryModel category}) async {
    var cId = await db.addCategory(category: category);
    log('Category id before: ${category.id}');
    category.id = cId;
    log('Category id after: ${category.id}');
  }

  Future<void> removeFromDatabase({required int categoryId}) async {
    await db.deleteCategory(categoryId: categoryId);
  }

  // NOTE: Only called when the app is launched
  Future<void> getCategoriesWithTask() async {
    categoriesWithTasks = await db.getCategoriesWithTasks();
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

  void resetState() {
    emit(HomeInitial());
  }
}
