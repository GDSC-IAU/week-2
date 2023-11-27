// TODO: Run task list app

import 'dart:io';
import 'task.dart';

final TaskListApp taskApp = TaskListApp();

void main(List<String> args) {
  print('------------------ Task Manager ------------------');
  print('------ Welcome to our beautfuil Task Manager -----');
  print('------  Please enter the menu option below  ------');
  print('--------------------------------------------------');

  print('--- 1 for "List Task"');
  print('--- 2 for "Add Task"');
  print('--- 3 for "Edit Task"');
  print('--- 4 for "Delete Task"');

  while (true) {
    print('Enter valid option: ');
    int option = int.tryParse(stdin.readLineSync()!) ?? -1;

    switch (option) {
      case 1:
        taskApp.listTasks();
        break;
      case 2:
        taskApp.editTask();
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
}

class TaskListApp {
  final List<Task> tasks = [];

  void listTasks() {
    if (tasks.isEmpty) return print("Empty tasks");

    print('---------- Task List ----------');
    for (final Task task in tasks) {
      print(
        '-- Task: ${task.title}, Completed: ${task.isCompleted}',
      );
    }
  }

  void addTask() {
  }

  void editTask() {}

  void deleteTask() {}
}
