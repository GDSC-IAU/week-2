class Task {
  int id;
  String title;
  String description;
  bool iscompleted;

  Task({
    this.id = -1,
    required this.title,
    required this.description,
    this.iscompleted = false,
  });
}
