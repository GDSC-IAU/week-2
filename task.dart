import 'dart:io';

class Task {
  int id;
  String? title;
  String? description;
  bool isCompleted;

  Task(this.id, this.title, this.description, this.isCompleted);
}

class TaskManager {
  List<Task> tasks = [];
  int id = 1;

  //Add tasks
  void addTask(String? title, String? description, bool isCompleted) {
    tasks.add(Task(id, title, description,
        isCompleted)); //takes constructor/object as a input

    id++;

    print("Task successfully added.");
    print("\n****************************************");
  }

  //Display tasks
  void display() {
    print("\n**************Display tasks***************");
    if (tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        Task task = tasks[i];
        print(
            "Task ID: ${task.id}\nTask name: ${task.title}\nTask Description: ${task.description}\nTask completed: ${task.isCompleted}");
        print("\n*****************************************");
      }
    } else {
      print("No tasks present.");
      print("\n*******************************************");
    }
  }

  //Delete tasks
  void delete(taskid) {
    print("\n**************Delete Task**************");
    if (tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        Task task = tasks[i];
        if (task.id == taskid) {
          tasks.removeAt(i);
          print("Task Removed Successfully.");
          print("\n***************************************");
          break;
        } else if (i == tasks.length - 1) {
          print("ID not present.");
          print("\n***************************************");
        }
      }
    } else {
      print("No Task to delete.");
      print("\n***************************************");
    }
  }

  //Update tasks
  void update(taskid) {
    print("*****************Update Task*****************\n");
    if (tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        Task task = tasks[i];
        if (task.id == taskid) {
          print("What do you want to update:");
          print("1)Title\n2)Description\n3)Status");
          int? option = int.tryParse(stdin.readLineSync() ?? '0');
          if (option == 1) {
            print("Please enter the new title: ");
            String? t = stdin.readLineSync();
            task.title = t;
            print("Title of task updated successfully.");
            print("\n*********************************************");
          } else if (option == 2) {
            print("Please enter the new description: ");
            String? d = stdin.readLineSync();
            task.description = d;
            print("Description of task updated successfully.");
            print("\n*********************************************");
          } else if (option == 3) {
            print("Please enter the new status: ");
            String? c = stdin.readLineSync();
            if (c == 'True' || c == 'true' || c == 'T' || c == 't') {
              task.isCompleted = true;
              print("Status of task updated successfully.");
              print("\n*********************************************");
            } else if (c == 'False' || c == 'false' || c == 'F' || c == 'f') {
              task.isCompleted = false;
              print("Status of task updated successfully.");
              print("\n*********************************************");
            } else {
              print("Please enter a correct status.");
              print("\n*********************************************");
            }
          } else {
            print("Please enter a valid option to update.");
            print("\n*********************************************");
          }
        } else if (i == tasks.length - 1) {
          print("ID not present.");
          print("\n*********************************************");
        }
      }
    } else {
      print("No Task to update");
      print("\n*********************************************");
    }
  }
}
