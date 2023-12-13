class TaskListApp {
  int id;
  String task_name;
  String description;
  bool isCompleted;

  // Default constructor
  TaskListApp()
      : this.withDetails(
            id: 0, task_name: '', description: '', isCompleted: false);

  // Constructor with named parameters
  TaskListApp.withDetails({
    required this.id,
    required this.task_name,
    required this.description,
    required this.isCompleted,
  });

  @override
  String toString() {
    String finished = isCompleted ? 'Yes' : 'No';
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    return 'Task ID: $id \nTaskName: $task_name \nDescription: $description \nFinished: $finished';

  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
