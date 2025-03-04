class CategoryModel {
  int id;
  final String date;
  String title;
  String label;
  bool isPinned;

  CategoryModel(
      {
      this.id = 0,
      required this.date,
      this.title = '',
      this.label = '',
      this.isPinned = false});

      Map<String, dynamic> toJson() {
        return {
          'id': id,
          'date': date,
          'title': title,
          'label': label,
          'isPinned': isPinned,
        };
      }

      factory CategoryModel.fromJson(json) {
        return CategoryModel(
          id: json.id ?? 0,
          date: json.date ?? '',
          title: json.title ?? '',
          label: json.label ?? '',
          isPinned: json.isPinned ?? false,
        );
      }
}
