import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/services/categories_table.dart';
import 'package:to_do_list_app/core/services/tasks_table.dart';
import 'package:rxdart/rxdart.dart';
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
  Future<void> addCategory(
      {required String title,
      required String label,
      required String date}) async {
    await into(categoriesTable).insert(CategoriesTableCompanion(
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

  Stream<List<CategoryWithTasks>> watchCategories() {
    final categoriesStream = select(categoriesTable).watch();
    final tasksStream = select(tasksTable).watch();
    return Rx.combineLatest2(categoriesStream, tasksStream,
        (List<CategoriesTableData> categories, List<TasksTableData> tasks) {
      return categories.map((category) {
        final tasksList =
            tasks.where((task) => task.categoryId == category.id).toList();
        return CategoryWithTasks(category: category, tasks: tasksList);
      }).toList();
    });
  }

  void updateCategory(int categoryId,
      {String? title, String? label, bool? isPinned}) {
    print("Updating category with ID: $categoryId");
    print("Title: $title, Label: $label, IsPinned: $isPinned");
    final updatedRows = (update(categoriesTable)
          ..where((category) => category.id.equals(categoryId)))
        .write(CategoriesTableCompanion(
      title: Value.absentIfNull(title),
      label: Value.absentIfNull(label),
      isPinned: Value.absentIfNull(isPinned),
    ));
    print(
        'After update isPinned = ${CategoriesTableCompanion(id: Value(categoryId)).isPinned}');
    print("Updated Rows: $updatedRows");
  }

  Future<void> updateTask(int taskId, {String? title, bool? isChecked}) async {
    await (update(tasksTable)..where((task) => task.id.equals(taskId))).write(
        TasksTableCompanion(
            title: title != null ? Value(title) : const Value.absent(),
            isChecked:
                isChecked != null ? Value(isChecked) : const Value.absent()));
  }

  Future<List<CategoryWithTasks>> getCategoriesWithTasks() async {
    final categories = await select(categoriesTable).get(); // جلب كل الفئات

    return Future.wait(categories.map((category) async {
      final tasksList = await (select(tasksTable)
            ..where((task) => task.categoryId.equals(category.id)))
          .get();
      return CategoryWithTasks(category: category, tasks: tasksList);
    }));
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
