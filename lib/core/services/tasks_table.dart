import 'package:drift/drift.dart';
import 'package:to_do_list_app/core/services/categories_table.dart';

class TasksTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // unique for each task
  IntColumn get categoryId => integer().references(CategoriesTable, #id,
      onDelete: KeyAction.cascade)(); // to link each task for its category
  TextColumn get title => text().withLength(min: 1, max: 100)();
  BoolColumn get isChecked => boolean().withDefault(const Constant(false))();
}
