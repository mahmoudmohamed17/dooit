part of 'category_cubit.dart';

class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryUpdate extends CategoryState {
  final CategoryWithTasks categoryWithTasks;

  CategoryUpdate({required this.categoryWithTasks});
}

final class CategoryLaoding extends CategoryState {}
