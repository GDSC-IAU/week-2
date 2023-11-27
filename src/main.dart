// TODO: Run task list app

import 'dart:io';
import 'task.dart';

void main(List<String> args) {
  final TaskListApp taskApp = TaskListApp();

  print('------------------ Task Manager ------------------');
  print('------ Welcome to our beautfuil Task Manager -----');
  print('------  Please enter the menu option below  ------');
  print('--------------------------------------------------');

  print('--- 1 for "List Task"');
  print('--- 2 for "Add Task"');
  print('--- 3 for "Edit Task"');
  print('--- 4 for "Delete Task"');
  print('--- -1 for "Exit App"');

  while (true) {
    print("");
    print('Enter valid option: ');
    // TODO change -1 to 0
    int option = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (option == -1) break;

    switch (option) {
      case 1:
        taskApp.listTasks();
        break;
      case 2:
        taskApp.addTask();
        break;
      case 3:
        taskApp.editTask();
        break;
      case 4:
        taskApp.deleteTask();
        break;
      default:
        print('Invalid option');
    }
  }

  print("Thank you for using our app");
}

class TaskListApp {
  final List<Task> tasks = [];

  void listTasks() {
    if (tasks.isEmpty) return print("Empty tasks");

    print('---------- Task List ----------');
    for (final (int index, Task task) in tasks.indexed) {
      print(
        '-- Task ${index + 1}: ${task.title}, Completed: ${task.isCompleted}',
      );
    }
  }

  void addTask() {
    print('---------- Create a task ----------');
    final String taskTitle = askUser("Enter task title: ");
    final String taskDescription = askUser("Enter task description: ");

    tasks.add(
      Task(title: taskTitle, description: taskDescription),
    );

    print(
      "Task has been created with title $taskTitle. Task total: ${tasks.length}",
    );
  }

  void editTask() {
    print('---------- Edit a task ----------');

    try {
      final int taskIndex = askUser("Enter task index:", true);

      final Task task = tasks[taskIndex - 1];

      print(
        '-- Task: ${task.title}, Description: ${task.description}, Completed: ${task.isCompleted}',
      );

      final String taskTitle = askUser("Enter task title: ");

      final String taskDescription = askUser("Enter task description: ");

      final int taskCompletation = askUser(
            "Did you complete your task? (1 for yes, any key for no): ",
            true,
          ) ??
          0;

      if (taskTitle.isNotEmpty) task.title = taskTitle;

      if (taskDescription.isNotEmpty) task.description = taskDescription;

      task.isCompleted = taskCompletation == 1;

      print(
        "Task $taskTitle with index $taskIndex has been edited.",
      );
    } catch (e) {
      print("Enter a valid task index!");
    }
  }

  void deleteTask() {
  }

  dynamic askUser(String messsage, [isInteger = false]) {
    print(messsage);
    return isInteger
        ? int.tryParse(stdin.readLineSync()!)
        : stdin.readLineSync();
  }
}
