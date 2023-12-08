import 'task.dart';

class TaskList {
  List<Task> _tasks = [];

  void addTask(String title, String description, bool iscompleted) {
    _tasks.add(Task(
      id: _tasks.length,
      title: title,
      description: description,
      iscompleted: iscompleted,
    ));
  }

  @override
  String toString() {
    String result = "";
    for (var task in _tasks) {
      result += "========================================\n";
      result += "Task ID: ${task.id}\n";
      result += "Task Title: ${task.title}\n";
      result += "Task Description: ${task.description}\n";
      result += "Is Completed: ${task.iscompleted ? "Yes" : "No"}\n";
      result += "========================================";
    }
    return result;
  }
}
