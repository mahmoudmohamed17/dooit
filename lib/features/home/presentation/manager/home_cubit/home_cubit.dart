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
    var category =
        await database.addCategory(title: title, label: label, date: date);
    categoriesWithTasks.add(CategoryWithTasks(category: category, tasks: []));
    emitHomeState();
  }

  Future<void> deleteCategory(
      {required CategoryWithTasks categoryWithTasks}) async {
    emit(HomeLoading());
    categoriesWithTasks.remove(categoryWithTasks);
    await database.deleteCategory(categoryId: categoryWithTasks.category.id);
    emitHomeState();
  }

  // only called when the app is launched
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

  void resetState() {
    emit(HomeInitial());
  }
}
