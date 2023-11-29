import 'task.dart';
import 'dart:io';

/*Implement a menu-driven interface that allows users to 
add, view, update, and delete tasks using the Task class.*/
void main() {
  TaskManager manager = new TaskManager();
  do {
    print("\n*********Welcome to Task Management System*********\n");
    stdout.write(
        'Please choose an option from the menu:\n1)Add Task\n2)View Task\n3)Delete Task\n4)Update Task\n0)To Exit\n');

    int? option = int.tryParse(stdin.readLineSync() ?? '0');

    if (option == 1) {
      print("\n****************Add Task****************\n");
      stdout.write("Please enter Task name: ");
      String? name = stdin.readLineSync();

      stdout.write("Please enter Task description: ");
      String? description = stdin.readLineSync();

      stdout.write("Is the task completed? (True/False): ");
      String? status = stdin.readLineSync();

      if (status == 'True' ||
          status == 'true' ||
          status == 'T' ||
          status == 't') {
        manager.addTask(name, description, true);
      } else if (status == 'False' ||
          status == 'false' ||
          status == 'F' ||
          status == 'f') {
        manager.addTask(name, description, false);
      } else {
        print("Please enter a valid status");
        print("\n****************************************");
      }
    } else if (option == 2) {
      manager.display();
    } else if (option == 3) {
      print("\nPlease enter the ID of the task you wish to delete: ");
      int? id = int.tryParse(stdin.readLineSync() ?? '0');
      manager.delete(id);
    } else if (option == 4) {
      print("\nPlease enter the ID of the task you want to update:");
      int? id = int.tryParse(stdin.readLineSync() ?? '0');
      if (id == null) {
        print("\nPlease enter a number.");
      } else {
        manager.update(id);
      }
    } else {
      exit(0);
    }
  } while (true);
}
