import 'TaskClass.dart';
import 'dart:io';

void main(){
 try {
  List<Map<int,TaskInfo>>  AddedTasks = [];
  while(true){
    
   
    print("Welcome Welcome:)\n~~~~~~~~~~~\nHere we can help you  manange your tasks. ");
    print("What would you like to do?\n1.Add a task to your list\n2.Veiw a task from your list\n3.Delete a task from your list\n4.Exist\n");
    String ? entry = stdin.readLineSync();
    TaskInfo AddedTask = TaskInfo('','','',false);
    if(entry == "1"){
      print("WELL DO\n Please enetr your task info:\n");
      
      stdout.write("Task Number: ");
      int taskNum = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      AddedTask.Num = taskNum.toString();

      stdout.write("Task Name: ");
      AddedTask.Name = stdin.readLineSync() ?? '';
      stdout.write("Task description: ");
      AddedTask.Description = stdin.readLineSync() ?? '';
      stdout.write("Task status -false or true-: ");
      AddedTask.CompletedOrNot = (stdin.readLineSync()?.toLowerCase() == 'true');


       AddedTasks.add({taskNum: AddedTask, });
      print("Great! task added successfully\n~~~~~~~~~~~~~~~~\n");
      

    }

    else if (entry == '2') {
      print("Enter task number: ");
      int? taskNumber = int.tryParse(stdin.readLineSync() ?? '');
      if(taskNumber != null && taskNumber > 0 && taskNumber <= AddedTasks.length){
        print("INFO: \n");
         AddedTasks[taskNumber - 1][taskNumber]?.Display();
      }
      }

    else if(entry == '3'){
      print("Enter task number: ");
      int? taskNumber = int.tryParse(stdin.readLineSync() ?? '');
      if(taskNumber != null && taskNumber > 0 && taskNumber <= AddedTasks.length){
         AddedTasks.removeAt(taskNumber - 1);
         print("Task deleted successfully");
      }
       else {
        print("Invalid task number. Please enter a valid number.");
      }
    }
   
    else if(entry == "4"){
      print("~~~~~~~~~~~~\nThank you for using our system :)");
      break;
    }
    

  }
 } catch (e){
  print("Invalid input");
 }

}