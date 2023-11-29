
import 'Task.dart' ;
import 'dart:io';


// TODO: Run task list app
void main(List<String> args) {
  var tasks=[];
  String x1,x2,x3,x4,x5;
  x1='1. Add task';
  x2='2. Update task';
  x3='3. Review task';
  x4='4. Remove task';
  x5='5. Exit';

while(true) {

  print('Welcome to your task list (:');
  print('''
  $x1
  $x2
  $x3
  $x4
  $x5
  ''');
  String? choice = stdin.readLineSync();

  switch(choice){
    case "1":
      TaskListApp app=TaskListApp();
      var New=app.addTask();
      tasks.add(New);
      continue;
  
    case "2":
    while(true){
    print("To update a task, enter task id:");
    int userIN=int.parse(stdin.readLineSync() ?? "-");
    try{
      print("id: ${tasks[userIN].id}");
      print("title: ");
      tasks[userIN].title=stdin.readLineSync();
      print("description: ");
      tasks[userIN].description=stdin.readLineSync();
      print("Successfully updated!");
      print("the new task is:\n" "id: ${tasks[userIN].id} , title: ${tasks[userIN].title} , description: ${tasks[userIN].description}");
      break;
      } catch(e) {
        print("Error, you entered a non-numeric value or the task does not exist");
        continue;      
      }
    }
    continue;

    case "3":
      for (var i in tasks){
        print("id: ${i.id} , title: ${i.title} , description: ${i.description}");
      }
      continue;
    
    case "4":
      while(true){
    print("To REMOVE a task, enter task id:");
    int userIN=int.parse(stdin.readLineSync() ?? "-");
    try{
      tasks.remove(userIN);
      print('Successfully removed!');
      break;
      } catch(e) {
        print("Error, you entered a non-numeric value or the task does not exist");
        continue;      
      }
    }

      continue;
      
    case "5":
    print("goodbye");
    return;

    default:
      print('Invalid value, please select a number from the list, You entered: $choice');
  }
  
}

}

class TaskListApp {
  // TODO: Implement Task list app


task addTask(){
  task newtask=task.create();
  
  print('enter the task title:');
  newtask.title=stdin.readLineSync();

  
  print('enter the task description:');
  newtask.description=stdin.readLineSync();
  newtask.IsCompleted=false;
  
  
  return newtask;
}

}