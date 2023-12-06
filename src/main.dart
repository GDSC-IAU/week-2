import 'dart:io';
//Run task list app
void main(List<String> args) {
   TaskListApp().run();
}

//task class
class Task {
int id;
String title;
String description;
bool isCompleted;

Task(this.id, this.title, this.description, this.isCompleted); 
}

class TaskList {
List<Task> tasks = [];
int nextTaskId = 1;

  //add task function

  void addTask(String title, String description ) {
      tasks.add(Task(nextTaskId, title, description, false));
      nextTaskId++;
  }

  //edit task function 

void editTask(int id, String newTitle, String newDescription) {
  try { var task = tasks.firstWhere((task) => task.id == id);
    task.title = newTitle;
    task.description = newDescription;
  } 
  catch (e) {
    print('Task not found');
  }
}

  //delete task function

  void deleteTask(int id) {
    var taskIndex = tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      tasks.removeAt(taskIndex);
    } else {
      print('Task not found');
    }
  }

  //complete task function

  void completeTask(int id) {
    try{
    var task = tasks.firstWhere((task) => task.id == id);
      task.isCompleted = true;}
      catch (e) {
    print('Task not found');
  }
  }

  //print tasks function 
  void printTasks() {
    for (var task in tasks) {
      var status = task.isCompleted ? '[x]' : '[ ]';
      print('${task.id}. $status ${task.title} - ${task.description}');
    }
  }

}

class TaskListApp {
  TaskList taskList = TaskList();
  void run() {
    //print the menu
    while (true) {
      print('Options:');
      print('1. Add Task');
      print('2. Edit Task');
      print('3. Delete Task');
      print('4. Mark Task as Completed');
      print('5. Print Tasks');
      print('6. Exit');
      print('Enter the number of the option you want to do');

      var option = stdin.readLineSync();
      switch (option) {

        case '1':
          print('Enter task title:');
          var title = stdin.readLineSync() ?? "none";
          print('Enter task description:');
          var description = stdin.readLineSync() ??"none ";
            taskList.addTask(title, description);
            print('Task added successfully!');

          break;

        case '2':
          print('Enter task id:');
          var idString = stdin.readLineSync();
          var id = int.tryParse(idString!);
          if (id != null) {
            print('Enter new task title:');
            var newTitle = stdin.readLineSync();
                if (newTitle == null || newTitle.trim().isEmpty) {
          newTitle = 'No description provided'; }
            print('Enter new task description:');
            var newDescription = stdin.readLineSync();
            if (newDescription == null || newDescription.trim().isEmpty) {
          newDescription = 'No description provided'; }
            taskList.editTask(id, newTitle, newDescription);
            print('Task edited successfully!');
          } else {
            print('Invalid task id');
          }
          break;

        case '3':
          print('Enter task id:');
          var id = int.tryParse(stdin.readLineSync()!);
          if (id != null) {
            taskList.deleteTask(id);
            print('Task deleted successfully!');
          } else {
            print('Invalid task id');
          }
          break;

        case '4':
          print('Enter task id:');
          var id = int.tryParse(stdin.readLineSync() ?? "none");
          if (id != null) {
            taskList.completeTask(id);
            print('Task marked as completed!');
          } else {
            print('Invalid task id');
          }
          break;

        case '5':
          print('Tasks:');
          taskList.printTasks();
          break;
          
        case '6':
          return;
          
        default:
          print('Invalid option');
      }

      print('\n');
    }
  }
}
