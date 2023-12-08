// TODO: Run task list app
import 'dart:io';
import 'tasklist.dart';

TaskList tasks = TaskList();
void main(List<String> args) {
  int choice = 0;

  while (choice != 4) {
    appMenu();
    bool choiceValid = false;

    while (!choiceValid) {
      try {
        stdout.write("Enter your choive: ");
        choice = int.parse(stdin.readLineSync()!);
        choiceValid = true;
      } catch (e) {
        print("Please entry a number");
      }
    }

    switch (choice) {
      case 1:
        addTask(tasks);
        break;
      case 2:
        viewTasks(tasks);
        break;
      // case 3:
      //   updatetask(tasks);
      //   break;
      case 4:
        print("think for using the app");
        break;
      default:
        print("Invalid choice");
        break;
    }
  }
}

void appMenu() {
  print("==========================================");
  print("TASK LIST APP");
  print("==========================================");
  print("Select your service: ");
  print("1. Add task");
  print("2. View task");
  print("3. Update task");
  print("4. Exit");
  print("==========================================");
}

void addTask(TaskList tasks) {
  try {
    stdout.write("Enter task title: ");
    String? title = stdin.readLineSync();
    if (title == null || title.trim() == "") {
      print("Title cannot be empty");
      return;
    }

    stdout.write("Enter task description: ");
    String? description = stdin.readLineSync();
    if (description == null || description.trim() == "") {
      print("Description cannot be empty");
      return;
    }

    print("Task added successfully!");
  } catch (e) {
    print("An error occurred while processing your request.");
  }
}

void viewTasks(TaskList tasks) {
  print(tasks.toString());
}

// void updateTask(TaskList tasks) {
//   try {
//     stdout.write("Enter task ID: ");
//     String? taskIdInput = stdin.readLineSync();

//     if (taskIdInput == null || taskIdInput.trim() == "") {
//       print("Task ID cannot be empty");
//       return;
//     }

//     int taskId = int.parse(taskIdInput);

//     print("Task updated successfully!");
//   } catch (e) {
//     print("An error occurred during the update");
//   }
// }

class TaskListApp {
  // TODO: Implement Task list app
}
