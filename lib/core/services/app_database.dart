import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_app/core/models/category_model.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/models/task_model.dart';
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
  Future<int> addCategory({required CategoryModel category}) async {
    return await into(categoriesTable).insert(CategoriesTableCompanion(
      title: Value(category.title),
      label: Value(category.label),
      date: Value(category.date),
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

  Future<int> addTask({required String title, required int categoryId}) async {
    return await into(tasksTable).insert(TasksTableCompanion(
        title: Value(title),
        categoryId: Value(categoryId),
        isChecked: const Value(false)));
  }

  Future<void> deleteTask({required int taskId}) async {
    await (delete(tasksTable)..where((task) => task.id.equals(taskId))).go();
  }

  Future<List<TaskModel>> getAllTasks() async {
    final query = await select(tasksTable).get();
    return query.map((row) => TaskModel.fromJson(row)).toList();
  }

  Future<List<TaskModel>> getTasksByCategory({required int categoryId}) async {
    final query = await (select(tasksTable)
          ..where((row) => row.categoryId.equals(categoryId)))
        .get();
    return query.map((row) => TaskModel.fromJson(row)).toList();
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

  Future<List<CategoryWithTasks>> getCategoriesWithTasks() async {
    final query = await (select(categoriesTable).join([
      leftOuterJoin(
          tasksTable, tasksTable.categoryId.equalsExp(categoriesTable.id))
    ])).get();

    List<CategoryWithTasks> result = [];
    for (var row in query) {
      final category =
          CategoryModel.fromJson(row.readTable(categoriesTable).toJson());
      final task = row.readTableOrNull(tasksTable) != null
          ? TaskModel.fromJson(row.readTable(tasksTable).toJson())
          : null;

      final existingCategory = result.firstWhere(
          (element) => element.category.id == category.id,
          orElse: () => CategoryWithTasks(category: category, tasks: []));
      if (!result.contains(existingCategory)) {
        result.add(existingCategory);
      }
      if (task != null) {
        existingCategory.tasks.add(task);
      }
    }
    return result;
  }

  Future<List<CategoryWithTasks>> getPinnedCategoriesWithTasks() async {
    final cQuery = await (select(categoriesTable)
          ..where((category) => category.isPinned))
        .get();
    final categories =
        cQuery.map((row) => CategoryModel.fromJson(row)).toList();
    return Future.wait(categories.map((category) async {
      final tasks = await getTasksByCategory(categoryId: category.id);
      return CategoryWithTasks(category: category, tasks: tasks);
    }));
  }

  Future<CategoryWithTasks> getCategoryWithTasks({required int id}) async {
    final cQuery = await (select(categoriesTable)
          ..where((c) => c.id.equals(id)))
        .getSingle();
    final category = CategoryModel.fromJson(cQuery);
    final tQuery =
        await (select(tasksTable)..where((t) => t.categoryId.equals(id))).get();
    final tasks = tQuery.map((row) => TaskModel.fromJson(row)).toList();
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
