class TaskListApp {
  int id;
  String taskname;
  String description;
  bool isCompleted;

  // Default constructor
  TaskListApp()
      : this.withDetails(
            id: 0, taskname: '', description: '', isCompleted: false);

  // Constructor with named parameters
  TaskListApp.withDetails({
    required this.id,
    required this.taskname,
    required this.description,
    required this.isCompleted,
  });

  @override
  String toString() {
    String finished = isCompleted ? 'Yes' : 'No';
    print("♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡♡");
    return 'Task number $id \ntaskname: $taskname \ndescription: $description \nFinished: $finished';

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
