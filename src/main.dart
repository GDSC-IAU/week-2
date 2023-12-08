import 'dart:io';
import 'Task.dart';
import 'assets.dart';

void main(List<String> args) {
  List<Task> tasks = [];

  // Display Welcome Message
  stdout.write('Welcome to Task List App\n');

  while (true) {
    // Display Tasks
    displayTasks(tasks);

    // Get User Input
    int choice =
        inputNumber("Enter Task ID or 0 to add a new task, -1 to exit");
    if (choice == -2) {
      continue;
    }

    // Add Task
    if (choice == 0) {
      try {
        tasks.add(addTask());
      } catch (e) {
        printError(e.toString());
        continue;
      }
    } else if (choice == -1) {
      stdout.write("\nThank you for using Task List App!\n");
      break;
    } else if (choice <= tasks.length && choice > 0) {
      taskMenu(tasks, choice);
    } else {
      printError("Invalid choice");
    }
  }
}

// Task Menu
void taskMenu(List<Task> tasks, int taskID) {
  taskID--;

  while (true) {
    // Display Task
    stdout.write(
        "\n\n\n----------------- Task #${taskID + 1} -----------------\n");
    stdout.write("${tasks[taskID].toString()}");
    stdout.write("--------------------------------------------------\n");

    // Display Menu
    stdout.write(
        "1) ${tasks[taskID].isCompleted ? 'Mark as Not Completed' : 'Mark as Completed'}\n");
    stdout.write("2) Edit\n");
    stdout.write("3) Delete\n");
    stdout.write("4) Back\n");

    // Get User Input
    int choice = inputNumber("Enter your choice");
    if (choice == -2) {
      continue;
    }

    switch (choice) {
      case 1:
        // Toggle Task Status
        tasks[taskID].toggleCompleted();
        printSuccess("Task status updated successfully!");
        break;
      case 2:
        // Edit Task
        editTask(tasks[taskID]);
        break;
      case 3:
        // Delete Task
        if (!confirm("Are you sure you want to delete this task?")) {
          break;
        }
        tasks.removeAt(taskID);
        printSuccess("Task deleted successfully!");
        return;
      case 4:
        // Back
        return;
      default:
        printError("Invalid choice");
    }
  }
}

// Add Task
Task addTask() {
  stdout.write('\n-------------------- New Task --------------------');

  // Get Task Title
  stdout.write('\nEnter Task Title: ');
  String taskTitle = stdin.readLineSync()!;
  if (taskTitle.isEmpty) {
    throw Exception('Task Title is required');
  }

  // Get Task Description
  stdout.write('Enter Task Description: ');
  String taskDescription = stdin.readLineSync()!;

  // Create Task
  Task task = Task(title: taskTitle, description: taskDescription);
  printSuccess("Task added successfully!");
  return task;
}

// Edit Task
void editTask(Task task) {
  stdout.write('\n-------------------- Edit Task -------------------\n');

  // Get New Task Title
  stdout.write("Enter new title: ");
  String newTitle = stdin.readLineSync()!;
  if (newTitle.isEmpty) {
    stdout.write("Task title cannot be empty!\n\n");
    return;
  }

  // Get New Task Description
  stdout.write("Enter new description: ");
  String newDescription = stdin.readLineSync()!;

  // Update Task
  task.title = newTitle;
  task.description = newDescription;

  // Display Success Message
  printSuccess("Task updated successfully!");
}

// Display Tasks
void displayTasks(List<Task> tasks) {
  // Display Number of Tasks
  stdout.write(
      '--------------- Number of Tasks: ${tasks.length} ---------------\n');

  // Check if tasks is empty
  if (tasks.isEmpty) {
    stdout.write('No Tasks Found!\n');
    return;
  }

  // Display Tasks
  int length = tasks.length;
  for (int i = 0; i < length; i++) {
    stdout.write(
        "${tasks[i].isCompleted ? '✅' : '❌'} ${i + 1}) ${tasks[i].title} \n");
  }
  stdout.write('-------------------------------------------------\n');
}
