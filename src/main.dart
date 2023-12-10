
import 'dart:io';
import 'task_list.dart';

 TaskList tasks = TaskList();
void main(List<String> args) {
  printMenu();

  bool choiceValid = false;
  int choice = -1;
  while(!choiceValid) {
    try {
      stdout.write("Enter your choice: ");
      choice = int.parse(stdin.readLineSync()!);
      choiceValid = true;
  } catch(e) {
    print("Please enter a number");
  }
}
switch(choice) {
  case 1:
  addTask();
  break;
  case 2:
  editTask();
  break;
  case 3:
  deleteTask();
  break;
  case 4:
  markTaskAsCompleted();
  break;
  case 5:
  tasks.printTasks();
  break;
  case 6:
  print("Thank you for using the Task List App");
  default:
  print("Invalid choice");
  break;


}
}
void printMenu() {
  print("==========================================");
  print("Task list app");
  print("==========================================");
  print("Select your service: ");
  print('1. Add a task');
  print('2. Edit a task');
  print('3. Delete a task');
  print('4. Mark a task as completed');
  print('5. Print tasks');
  print('6. Exit');
  print("==========================================");
}

void addTask() {
  stdout.write("Enter task title: ");
  String? title = stdin.readLineSync() ??"";
  if(title.trim() == ""){
    print("Title cannot be empty");
    return;
  }
  stdout.write("Enter task description: ");
  String? description = stdin.readLineSync() ??"";
  if(description.trim() == ""){
    print("Description cannot be empty");
    return;
  }
  tasks.addTask(title, description);
}

void editTask() {
  stdout.write("Enter the index of the task to edit: ");
  int index = int.parse(stdin.readLineSync()!);
  if(index < 0 || index >= tasks.length) {
    print("Invalid task index.");
    return;
  }
  stdout.write("Enter the new task title: ");
  String newTitle = stdin.readLineSync()!;
  tasks.editTask(index, newTitle);
}

void deleteTask(){
  stdout.write("Enter the index of the task to delete: ");
  int index = int.parse(stdin.readLineSync()!);
  if(index < 0 || index >= tasks.length){
    print("Invalid task index.");
    return;
  }
  tasks.deleteTask(index);
}

void markTaskAsCompleted(){
  stdout.write("Enter the index of the task to mark as completed: ");
  int index = int.parse(stdin.readLineSync()!);
  if(index < 0 || index >= tasks.length){
    print("Invalid task index.");
    return;
  }
  tasks.markTaskAsCompleted(index);
}

 