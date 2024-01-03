import 'dart:io';

class Task {
  String description;
  bool isCompleted;

  Task(this.description, {this.isCompleted = false});
}

void main() {
  final List<Task> tasks = [];

  while (true) {
    print("Task List");
    print("1. task number.");
    print("2. Add Title.");
    print("3. add description.");
    print("4. edit Task.");
    print("5. delete task.");
    print("6. mark task as completed.");
    print("7. show all tasks.");
    print("8. exit.");

    String input = stdin.readLineSync() ?? " ";
    int choice = int.tryParse(input) ?? 0;

    switch (choice) {
      
      case 1:
       addTasknum(tasks);
       break;
      case 2:
       addTitle(tasks);
       break;
      case 3:
        addDescription(tasks);
        break;
      case 4:
        edittask(tasks);
        break;
      case 5:
        deleteTask(tasks);
        break;
      case 6:
        MarkTaskCompleted(tasks);
        break;
      case 7:
        ShowTask(tasks);
        break;
      case 8:
        exit(0);
      default:
        print("Invalid choice. Please try again.");
        break;
    }

    print("\n");
  }
}

void addTasknum(List<Task>task){
  stdout.write("hello! enter your task number please: ");
  int? tasknum;
  while (true){
    tasknum = int.tryParse(stdin.readLineSync()!);
    if(tasknum == null){
      print("please write a number not a letter");
      }else {
        break;
      };
    }
    print ("your task number added successfully !.");
}

void addTitle(List<Task> task){
  stdout.write("please enter your task title : ");
  String title = stdin.readLineSync() ?? "none";
  print("task title added successfully !. ");
  if (title.isEmpty){
    throw Exception("your title is empty");
  }
}

void addDescription(List<Task> task){
print("enter your task description (to exit write exite):");
  String description = stdin.readLineSync()!;

  if (description.isEmpty){ 
    throw Exception("your description is empty.");
  }

  while (true){
    String? input = stdin.readLineSync();
    if (input == 'exit'){
      break;
    }
    description += "\n $input";
  }
  task.add(Task(description));
  print("your description is : $description");
   
}

void edittask(List<Task> task){
  if(task.isEmpty){ // if empty
    print("there are no tasks to edit");
    return;
  }
  printTasks(task); // to show tasks 
  print("enter task index to edit: ");
  int? index = readIndex(task.length);
  if (index == null){
    print ("invalid task index!.");
    return;
  }
  print ("enter new task description: ");
  String? description = stdin.readLineSync();
  if (description == null || description.isEmpty){
    print("description cant be empty");
    return;
  }
  task[index].description = description;
  printTasks(task);
  print("Task edited successfully!");
}

void deleteTask(List<Task> tasks) {
  if (tasks.isEmpty) {
    print("No tasks available to delete.");
    return;
  }

  printTasks(tasks);
  print("Enter the task index to delete:");
  int? index = readIndex(tasks.length);

  if (index == null) {
    print("Invalid task index.");
    return;
  }

  tasks.removeAt(index);
  print("Task deleted successfully!");
}

void MarkTaskCompleted(List<Task>task){
  if (task.isEmpty) {
    print("No tasks available to mark as completed.");
    return;
  }
  printTasks(task);
  print("plaese enter the task index to mark copmleted: ");
  int? index = readIndex(task.length);

  if (index == null) {
    print("Invalid task index.");
    return;
  }

  if (task[index].isCompleted) {
    print("Task is already marked as completed.");
  } else {
    task[index].isCompleted = true;
    print("Task marked as completed! yaay ");
  }
}

void ShowTask(List<Task>task){
  if (task.isEmpty) {
    print("No tasks available :( .");
    return;
  }
  printTasks(task);
}

int? readIndex(int maxIndex) {
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? " ");

  if (index == null || index < 0 || index >= maxIndex) {
    return null;
  }

  return index;
}

void printTasks(List<Task> tasks) {
  for (int i = 0; i < tasks.length; i++) {
    Task task = tasks[i];
    String status = task.isCompleted ? "[X]" : "[ ]"; 
    print("$i. $status ${task.description}");
  }
}