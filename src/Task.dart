class Task {
  String title;
  String description;
  bool isCompleted = false;

  Task({required this.title, this.description = ''});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return "| Title:\n  ${title}\n| Description:\n  ${description}\n| Status:\n  ${isCompleted ? '✅Completed' : '❌Not Completed'}\n";
  }
}
