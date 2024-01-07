// TODO: Run task list app
import 'taskClass.dart';
import 'dart:io';

void printMenu() {
  print('\n-------------------------');
  print('-     Task List App     -');
  print('-------------------------');
  print('- 1. Add a Task         -');
  print('- 2. Edit a Task        -');
  print('- 3. Delete a Task      -');
  print('- 4. Mark as Completed  -');
  print('- 5. Print Tasks List   -');
  print('- 6. Exit               -');
  print('-------------------------\n');
}

void addTask() {
  stdout.write('\nEnter Task title: ');
  String? t = stdin.readLineSync();
  stdout.write('\nEnter Task Description: ');
  String? d = stdin.readLineSync();
  TaskListApp.tasks.add(new TaskListApp(t!, d!));
}

void editTask(int no) {
  if (TaskListApp.tasks.elementAtOrNull(no) != null) {
    stdout.write('\nEdit Task title: ');
    String? t = stdin.readLineSync();
    stdout.write('\nEdit Task Description: ');
    String? d = stdin.readLineSync();
    TaskListApp.tasks.elementAt(no).title = t!;
    TaskListApp.tasks.elementAt(no).description = d!;
  } else {
    print('Task dose not exist!\n');
  }
}

void deleteTask(int no) {
  TaskListApp.tasks.remove(no);
  TaskListApp.count--;
  for (int i = no; i < TaskListApp.tasks.length; i++) {
    TaskListApp.tasks.elementAt(i + 1).id = i;
  }
}

void markCompleted(int no) {
  if (TaskListApp.tasks.elementAtOrNull(no) != null) {
    TaskListApp.tasks.elementAt(no).isCompleted = true;
    print('${TaskListApp.tasks.elementAt(no).title} task is Completed! ;) ');
  } else {
    print('Task dose not exist!\n');
  }
}

void printTasksList() {
  for (int i = 0; i < TaskListApp.tasks.length; i++) {
    print(
        '${TaskListApp.tasks.elementAt(i).id}. ${TaskListApp.tasks.elementAt(i).title}');
    print('Description: ${TaskListApp.tasks.elementAt(i).description}');
    if (TaskListApp.tasks.elementAt(i).isCompleted) {
      print('Completion Status: Completed\n');
    } else {
      print('Completion Status: In Progress\n');
    }
  }
}

int? getUserInput(String prompt) {
  while (true) {
    try {
      // Get user input as a string
      stdout.write("$prompt ");
      String userInput = stdin.readLineSync()!;

      // Convert the input to an integer
      int number = int.parse(userInput);

      // If conversion is successful, return the number
      return number;
    } catch (e) {
      // Handle the exception (error) and prompt the user again
      print("Invalid input. Please enter a valid integer.");
    }
  }
}

int getIndex(Set<TaskListApp> set, int element) {
  for (int i = 0; i < set.length; i++) {
    if (TaskListApp.tasks.elementAt(i).id == element) {
      return i;
    }
  }
  return -1; // Element not found
}

void main(List<String> args) {
  TaskListApp task1 = TaskListApp('Buy groceries', 'Buy milk, eggs, and bread');
  TaskListApp task2 =
      TaskListApp('Read a book', 'Read "The Catcher in the Rye"');
  int c = 0;
  do {
    printMenu();
    int? choice = getUserInput("Enter your choice:");
    c = choice!;
    switch (c) {
      case 1:
        print('\t__ Adding __\n');
        addTask();
        break;
      case 2:
        print('\t__ Editing __\n');
        int? no = getUserInput("Enter task number:");
        editTask(no!);
        break;
      case 3:
        print('\t__ Deleting __\n');
        int? no = getUserInput("Enter task number:");
        int index = getIndex(TaskListApp.tasks, no!);
        if (index != -1) {
          deleteTask(no);
        } else {
          print('Task dose not exist!\n');
        }
        break;
      case 4:
        print('\t__ Mark as Completed __\n');
        int? no = getUserInput("Enter task number:");
        markCompleted(no!);
        break;
      case 5:
        print('\t__ Tasks List __\n');
        printTasksList();
        break;
      case 6:
        print('\t__ Exiting __\n\t__THANK YOU__\n');
        break;
      default:
        print('Enter a valid choice!\n');
    }
  } while (c != 6);
}
