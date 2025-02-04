part of 'category_cubit.dart';

class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryUpdate extends CategoryState {
  final List<TasksTableData> tasks;

  CategoryUpdate({required this.tasks});
}

final class CategoryLaoding extends CategoryState {}
