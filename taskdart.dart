/*Create a new Dart file (e.g., task_list.dart) to build the task list app.
Implement a menu-driven interface that allows users to, view update, and delete tasks using the Task class.*/
import 'dart:io';

void main() {
  //Task task1 = Task(1, 'Buy groceries', 'Buy milk, eggs, and bread', false);
  //Task task2 = Task(2, 'Read a book', 'Read "The Catcher in the Rye"', true);

  //print('Task 1: ${task1.title}, Completed: ${task1.isCompleted}');
  //print('Task 2: ${task2.title}, Completed: ${task2.isCompleted}');
  app taskListApp = app();
  taskListApp.ap();
}

class Task {
  // task class
  int id;
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});
}

class app {
  List<Task> tasks = [];
  // we want to put a menu for the user to choose or view, update, deleteing tasks
  // we want to make a method for the user the user to choose to add and so on

  void menu() {
    print('Task list app');
    print('please choose what you want to do');
    print('1. add tasks');
    print('2. view tasks');
    print('3. update tasks');
    print('4. delete tasks');
    print('5. exit ');
  }

  // now we want to make methods for what the user want to choose
  // we want something to read from tje user so we will user dart io:

  void add() {
    print('Please enther the task deatils');
    stdout.write('please enter the task title: ');
    String title = stdin.readLineSync()!;
    stdout.write('please enter the task description: ');
    String description = stdin.readLineSync()!;
    bool isCompleted =
        false; // the added tasks are not completed because it's new

    int taskId = tasks.length + 1;
    Task newTask = Task(
      id: taskId,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
    tasks.add(newTask);
    print('Task added successfully');
  }

  void view() {
    print('Task List:');
    for (var task in tasks) {
      print('Task ${task.id}: ${task.title}, Completed: ${task.isCompleted}');
    }
  }

  void update() {
    view();
    stdout.write('Enter the task ID to update: ');
    int taskId = int.parse(stdin.readLineSync()!);

    Task? taskToUpdate;
    for (var task in tasks) {
      if (task.id == taskId) {
        taskToUpdate = task;
        break;
      }
    }

    if (taskToUpdate != null) {
      print('Update Task ${taskToUpdate.id}:');
      stdout.write('New Task Title: ');
      taskToUpdate.title = stdin.readLineSync()!;
      stdout.write('New Task Description: ');
      taskToUpdate.description = stdin.readLineSync()!;
      print('Task updated successfully');
    } else {
      print('Task not found with ID: $taskId');
    }
  }

  void delete() {
    view();
    stdout.write('Enter the task ID to delete: ');
    int taskId = int.parse(stdin.readLineSync()!);

    Task? taskToDelete;
    for (var task in tasks) {
      if (task.id == taskId) {
        taskToDelete = task;
        break;
      }
    }

    if (taskToDelete != null) {
      tasks.remove(taskToDelete);
      print('Task deleted successfully!');
    } else {
      print('Task not found with ID: $taskId');
    }
  }

  void ap() {
    while (true) {
      menu();
      stdout.write('Enter the number of you want to do (1-5): ');
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          add();
          break;
        case 2:
          view();
          break;
        case 3:
          update();
          break;
        case 4:
          delete();
          break;
        case 5:
          print('Exiting Task List App.');
          exit(0);
          break;
        default:
          print('Invalid choice. Please enter a number between 1 and 5.');
      }
    }
  }
} // this is for the end of the class because its get me lost
