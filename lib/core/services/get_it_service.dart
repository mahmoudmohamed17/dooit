import 'package:get_it/get_it.dart';
import 'package:to_do_list_app/core/services/app_database.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}
