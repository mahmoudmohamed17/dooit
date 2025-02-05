part of 'pinned_cubit.dart';

class PinnedState {}

final class PinnedInitial extends PinnedState {}

final class PinnedLoading extends PinnedState {}

final class PinnedFilled extends PinnedState {
  final List<CategoryWithTasks> pinnedCategories;

  PinnedFilled({required this.pinnedCategories});
}
