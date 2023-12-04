import 'task.dart';
import 'package:dolumns/dolumns.dart';
import 'dart:io';
import 'dart:core';

TaskList taskList = TaskList();
Task myTask = Task();

class TaskList {
  List<Task> taskList = [];
  int id = 1;

  //addTaskfunction
  void addTask(Task myTask) {
    myTask.id = id;
    id++;

    //promt user to enter title and dec
    stdout.write("Enter Task title: ");
    myTask.title = stdin.readLineSync();

    stdout.write("Enter Task descrption: ");
    myTask.description = stdin.readLineSync();

    ///add tasks
    taskList.add(myTask);
  }

  void isDone() {
    //choice a task id
    stdout.write("Enter Task ID to mark as complete: ");
    int taskId = int.parse(stdin.readLineSync()!);
    Task foundTask =
        taskList.firstWhere((task) => task.id == taskId, orElse: () => Task());
    // Check if the task was found
    if (foundTask.id != -1) {
      // Update the isDone property of the found task
      foundTask.isDone = true;
    } else {
      print("not a valid id");
    }
  }

  void edit() {
    stdout.write("Enter Task ID to edit: ");
    Task foundTask = serchForTaskById();
    if (foundTask.id != -1) {
      stdout.write("Enter new Task title: ");
      foundTask.title = stdin.readLineSync();

      stdout.write("Enter new Task descrption: ");
      foundTask.description = stdin.readLineSync();
    } else {
      print("not a valid id");
    }
  }

  void delete() {
    stdout.write("Enter Task ID to delete: ");
    Task foundTask = serchForTaskById();
    if (foundTask.id != -1) {
      taskList.remove(foundTask);
    } else {
      print("not a valid id");
    }
  }

  //serch for the id enterd my the user
  Task serchForTaskById() {
    int taskId = int.parse(stdin.readLineSync()!);
    Task foundTask =
        taskList.firstWhere((task) => task.id == taskId, orElse: () => Task());
    return foundTask;
  }
}

// Function to display all tasks in a table
void displayAllTasks(List<Task> taskList) {
  final columns = dolumnify([
    ['id', 'task', 'description', 'isDone'],
    for (var task in taskList)
      [
        task.id?.toString() ?? '',
        task.title ?? '',
        task.description ?? '',
        task.isDone?.toString() ?? ''
      ],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');

  print("All Tasks:\n");
  print(columns);
}
