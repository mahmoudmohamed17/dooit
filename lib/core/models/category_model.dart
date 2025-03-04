class CategoryModel {
  final int id;
  final String date;
  String title;
  String label;
  bool isPinned;

  CategoryModel(
      {required this.id,
      required this.date,
      this.title = '',
      this.label = '',
      this.isPinned = false});
}
