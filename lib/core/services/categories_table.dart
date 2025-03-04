import 'package:drift/drift.dart';

class CategoriesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get label => text().withLength(min: 1, max: 10)();
  TextColumn get date => text().withLength(min: 1, max: 15)();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
}
