// TODO: Run task list app

import 'dart:io';

final List<TaskListApp> tasks = [];

void main(List<String> args) {
  // attacking radwan,
// I am newbie in programming, what is loop?

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
      default:
        print('Invalid option');
    }
  }
}

void addTask() {}

void editTask() {}

void deleteTask() {}

class TaskListApp {
  // TODO: Implement Task list app
}
