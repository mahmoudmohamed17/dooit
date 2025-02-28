import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/categories_table.dart';
import 'package:to_do_list_app/core/services/tasks_table.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [
  CategoriesTable,
  TasksTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // basic operations

  // as we need the data inside the category when
  // navigating to the details body we return [CategoriesTableData]
  Future<CategoriesTableData> addCategory(
      {required String title,
      required String label,
      required String date}) async {
    return await into(categoriesTable).insertReturning(CategoriesTableCompanion(
      title: Value(title),
      label: Value(label),
      date: Value(date),
      isPinned: const Value(false),
    ));
  }

  // delete a category with its tasks
  // removes the tasks first as it's linked to the category
  Future<void> deleteCategory({required int categoryId}) async {
    await Future.wait([
      (delete(tasksTable)..where((task) => task.categoryId.equals(categoryId)))
          .go(),
      (delete(categoriesTable)
            ..where((category) => category.id.equals(categoryId)))
          .go(),
    ]);
  }

  Future<void> addTask({required String title, required int categoryId}) async {
    await into(tasksTable).insert(TasksTableCompanion(
        title: Value(title),
        categoryId: Value(categoryId),
        isChecked: const Value(false)));
  }

  Future<void> deleteTask({required int taskId}) async {
    await (delete(tasksTable)..where((task) => task.id.equals(taskId))).go();
  }

  Future<List<TasksTableData>> getTasksByCategory(
      {required int categoryId}) async {
    final tasks = (select(tasksTable)
          ..where((task) => task.categoryId.equals(categoryId)))
        .get();
    return tasks;
  }

  void updateCategory(int categoryId,
      {String? title, String? label, bool? isPinned}) {
    (update(categoriesTable)
          ..where((category) => category.id.equals(categoryId)))
        .write(CategoriesTableCompanion(
      title: Value.absentIfNull(title),
      label: Value.absentIfNull(label),
      isPinned: Value.absentIfNull(isPinned),
    ));
  }

  void updateTask(int taskId, {String? title, bool? isChecked}) {
    (update(tasksTable)..where((task) => task.id.equals(taskId))).write(
        TasksTableCompanion(
            title: Value.absentIfNull(title),
            isChecked: Value.absentIfNull(isChecked)));
  }

  Stream<List<CategoryWithTasks>> watchCategoriesTable() {
    return select(categoriesTable).watch().asyncMap((categories) async {
      return Future.wait(categories.map((category) async {
        final tasks = await getTasksByCategory(categoryId: category.id);
        return CategoryWithTasks(category: category, tasks: tasks);
      }));
    });
  }

  Future<List<CategoryWithTasks>> getPinnedCategoriesWithTasks() async {
    final catgories = await select(categoriesTable).get();
    final pinnedCategories =
        catgories.where((category) => category.isPinned).toList();
    return Future.wait(pinnedCategories.map((category) async {
      final tasks = await getTasksByCategory(categoryId: category.id);
      return CategoryWithTasks(category: category, tasks: tasks);
    }));
  }

  Future<CategoryWithTasks> getCategoryWithTasks({required int id}) async {
    final category = await (select(categoriesTable)
          ..where((c) => c.id.equals(id)))
        .getSingle();
    final tasks =
        await (select(tasksTable)..where((t) => t.categoryId.equals(id))).get();
    return CategoryWithTasks(category: category, tasks: tasks);
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
