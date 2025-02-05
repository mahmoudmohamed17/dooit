part of 'home_cubit.dart';

final class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFilled extends HomeState {
  final List<CategoryWithTasks> categoriesWithTasks;

  HomeFilled({required this.categoriesWithTasks});
}
