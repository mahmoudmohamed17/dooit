import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final database = getIt.get<AppDatabase>();
  List<CategoryWithTasks> categoriesWithTasks = [];

  Future<void> addCategory(
      {required String title,
      required String date,
      required String label}) async {
    emit(HomeLoading());
    await database.addCategory(title: title, label: label, date: date);
    getCategoriesWithTask();
  }

  Future<void> deleteCategory({required int categoryId}) async {
    emit(HomeLoading());
    await database.deleteCategory(categoryId: categoryId);
    getCategoriesWithTask();
  }

  Future<void> getCategoriesWithTask() async {
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
