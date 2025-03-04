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

  factory TaskModel.fromJson(json) {
    return TaskModel(
        id: json.id ?? 0,
        categoryId: json.categoryId ?? 0,
        title: json.title ?? '',
        isChecked: json.isChecked ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'isChecked': isChecked,
    };
  }
}
