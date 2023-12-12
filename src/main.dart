import 'dart:io';
import 'tasklist.dart';
import 'task.dart';

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
      case 3:
        updateTask(tasks);
        break;
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
    if (title == null || title.trim().isEmpty) {
      print("Title cannot be empty");
      return;
    }

    stdout.write("Enter task description: ");
    String? description = stdin.readLineSync();
    if (description == null || description.trim().isEmpty) {
      print("Description cannot be empty");
      return;
    }

    tasks.addTask(title, description, false);

    print("Task added successfully!");
  } catch (e) {
    print("An error occurred while processing your request.");
  }
}

void viewTasks(TaskList tasks) {
  List<Task> taskList = tasks.getAllTasks();

  if (taskList.isEmpty) {
    print("No tasks available");
    return;
  }

  print("========================================");
  print("TASK LIST");
  print("========================================");

  for (Task task in taskList) {
    print("Task ID: ${task.id}");
    print("Title: ${task.title}");
    print("Description: ${task.description}");
    print("Status: ${task.isCompleted ? "Completed" : "Incomplete"}");
  }
}

void updateTask(TaskList tasks) {
  try {
    stdout.write("Enter task ID: ");
    String? taskIdInput = stdin.readLineSync();

    if (taskIdInput == null || taskIdInput.trim().isEmpty) {
      print("Task ID cannot be empty");
      return;
    }

    int taskId = int.parse(taskIdInput);

    Task? taskToUpdate = tasks.getTaskById(taskId);

    if (taskToUpdate == null) {
      print("Task not found");
      return;
    }

    taskToUpdate.updateStatus(true);

    print("Task updated successfully!");
  } catch (e) {
    print("An error occurred during the update");
  }
}

// class TaskListApp {
//   // TODO: Implement Task list app
// }
