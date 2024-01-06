class TaskListApp {
  // TODO: Implement Task list app
  int id = 0;
  String title = "";
  String description = "";
  bool isCompleted = false;
  static int count = 0;
  static Set<TaskListApp> tasks = {};

  TaskListApp(String title, String description) {
    this.id = count;
    this.title = title;
    this.description = description;
    this.isCompleted = false;
    count++;
    tasks.add(this);
  }
}
