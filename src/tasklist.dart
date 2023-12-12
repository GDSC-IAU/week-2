import 'task.dart';

class TaskList {
  List<Task> _tasks = [];

  void addTask(String title, String description, bool isCompleted) {
    _tasks.add(Task(
      id: _tasks.length,
      title: title,
      description: description,
      isCompleted: isCompleted,
    ));
  }

  Task? getTaskById(int taskId) {
    try {
      return _tasks.firstWhere((task) => task.id == taskId);
    } catch (e) {
      return null;
    }
  }

  List<Task> getAllTasks() {
    return List.from(_tasks);
  }

  @override
  String toString() {
    String result = "";
    for (var task in _tasks) {
      result += "========================================\n";
      result += "Task ID: ${task.id}\n";
      result += "Task Title: ${task.title}\n";
      result += "Task Description: ${task.description}\n";
      result += "Is Completed: ${task.isCompleted ? "Yes" : "No"}\n";
      result += "========================================";
    }
    return result;
  }
}
