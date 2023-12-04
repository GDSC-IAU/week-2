import 'dart:io';
import 'package:dolumns/dolumns.dart';
import 'task.dart';
import 'task_list.dart';

//todo: Run task list app
void main(List<String> args) {
  printMenu();
  TaskList taskList = TaskList();

  while (true) {
    //create an incitnce of class Task
    Task myTask = Task();
    bool choiceValid = false;

    int choice = -1;
    while (!choiceValid) {
      try {
        stdout.write("Enter a number: ");
        choice = int.parse(stdin.readLineSync()!);
        choiceValid = true;
      } catch (e) {
        print("Plase Enter a number: ");
      }
    }

    switch (choice) {
      case 1:
        // call add task function
        taskList.addTask(myTask);
        break;
      case 2:
        taskList.edit();
        break;
      case 3:
        taskList.isDone();
        break;
      case 4:
        taskList.delete();
        break;

      case 5:
        exit(0);

      default:
        print("invalid choise");
        break;
    }

    // call display function
    displayAllTasks(taskList.taskList);
    //call options for the user
    options();
  }
}

void printMenu() {
  print('\n<<wlecome to cli tasklist app>>\n');
  final columns = dolumnify([
    ['id', 'task', 'description', 'isDone'],
    ['', ' ', '', ''],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');
  print(columns);
  options();
}

void options() {
  print("1.add");
  print("2.edit");
  print("3.mark as complite");
  print("4.delete");
  print("5.exit");
}

class TaskListApp {
  /* todo: Implement Task list app */
}
