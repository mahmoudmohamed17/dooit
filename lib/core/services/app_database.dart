import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list_app/core/services/categories_table.dart';
import 'package:to_do_list_app/core/services/tasks_table.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [
  CategoriesTable,
  TasksTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  

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
