import 'dart:developer';

import 'dart:io';

class Task {
  int? taskID;
  String? name;
  String? description;
  bool? isCompleted;

  Task(this.taskID, this.name, this.description, this.isCompleted);
}

class TaskManager {
  List<Task> tasks = [];
  int taskID = 1;

  // Add task
  void addTask(String? name, String? description) {
    tasks.add(Task(taskID, name, description, false));
    taskID++;
  }

  // List Tasks
  void listTask() {
    for (int i = 0; i < tasks.length; i++) {
      Task task = tasks[i];
      print(
          "${task.taskID}. [${task.isCompleted! ? 'X' : ' '}] ${task.name}: ${task.description}");
    }
  }

  // Delete Task
  void deleteTask(int taskID) {
    int index = tasks.indexWhere((task) => task.taskID == taskID);
    if (index != -1) {
      print("Deleting task ID $taskID");
      tasks.removeAt(index);
      print("Task deleted successfully!");
    } else {
      print("Task with ID $taskID not found.");
    }
  }

  // Mark Task as Complete
  void marktaskComplete(int taskID) {
    var task = tasks.firstWhere((task) => task.taskID == taskID);
    if (task != null) {
      task.isCompleted = true;
      print("Task with ID $taskID marked as completed.");
    } else {
      print("Task with ID $taskID Not found.");
    }
  }
}

void main(List<String> arguments) {
  TaskManager taskManager = TaskManager();

  while (true) {
    print("Task Management system");
    print("1. Add task");
    print("2. List Tasks");
    print("3. Delete Task");
    print("4. Mark Task as Complete");
    print("5. Exit");
    print("Enter you choice: ");

    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        print("Enter the task name: ");
        String? taskName = stdin.readLineSync() ?? "";
        print("Enter the description: ");
        String? taskdescription = stdin.readLineSync() ?? "";
        taskManager.addTask(taskName, taskdescription);
        break;
      case 2:
        taskManager.listTask();
        break;
      case 3:
        print("Enter the ID of the task to delete: ");
        int? taskID = int.tryParse(stdin.readLineSync() ?? "");
        taskManager.deleteTask(taskID!);
        break;
      case 4:
        print("Enter the ID of the task to mark as completed: ");
        int? taskID = int.tryParse(stdin.readLineSync() ?? "");
        taskManager.marktaskComplete(taskID!);
        break;
      case 5:
        print("Program is over");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
