import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getCategoriesWithTask();
  }
  final database = getIt.get<AppDatabase>();
  List<CategoryWithTasks> categoriesWithTasks = [];

  Future<void> addCategory(
      {required String title,
      required String date,
      required String label}) async {
    emit(HomeLoading());
    var category =
        await database.addCategory(title: title, label: label, date: date);
    categoriesWithTasks.add(CategoryWithTasks(category: category, tasks: []));
    getCategoriesWithTask();
  }

  void deleteCategory({required CategoryWithTasks categoryWithTasks}) {
    emit(HomeLoading());
    categoriesWithTasks.remove(categoryWithTasks);
    getCategoriesWithTask();
  }

  Future<void> addToDatabase(
      {required String title,
      required String date,
      required String label}) async {
    await database.addCategory(title: title, label: label, date: date);
  }

  Future<void> removeFromDatabase(
      {required CategoryWithTasks categoryWithTasks}) async {
    await database.deleteCategory(categoryId: categoryWithTasks.category.id);
  }

  // only called when the app is launched
  void getCategoriesWithTask() {
    database.watchCategoriesTable().listen((data) {
      categoriesWithTasks = data;
    });
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
