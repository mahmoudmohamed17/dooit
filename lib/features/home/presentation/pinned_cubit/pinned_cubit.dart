import 'package:bloc/bloc.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/app_database.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
part 'pinned_state.dart';

class PinnedCubit extends Cubit<PinnedState> {
  PinnedCubit() : super(PinnedInitial());
  final database = getIt.get<AppDatabase>();
  List<CategoryWithTasks> pinnedCategories = [];
  Future<void> addToPinned(
      {required CategoryWithTasks categoryWithTasks}) async {
    emit(PinnedLoading());
    pinnedCategories.add(categoryWithTasks);
    database.updateCategory(categoryWithTasks.category.id, isPinned: true);
    await getPinnedCategoriesWithTasks();
  }

  Future<void> deleteFromPinned(
      {required CategoryWithTasks categoryWithTasks}) async {
    emit(PinnedLoading());
    pinnedCategories.remove(categoryWithTasks);
    database.updateCategory(categoryWithTasks.category.id, isPinned: false);
    await getPinnedCategoriesWithTasks();
  }

  Future<void> getPinnedCategoriesWithTasks() async {
    pinnedCategories = await database.getPinnedCategoriesWithTasks();
    emitPinnedState();
  }

  void emitPinnedState() {
    if (pinnedCategories.isEmpty) {
      emit(PinnedInitial());
    } else {
      emit(PinnedFilled(pinnedCategories: List.unmodifiable(pinnedCategories)));
    }
  }
}
