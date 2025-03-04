class TaskModel {
  final int id;
  final int categoryId;
  String title;
  bool isChecked;

  TaskModel(
      {required this.id,
      required this.categoryId,
      this.title = '',
      this.isChecked = false});
}
