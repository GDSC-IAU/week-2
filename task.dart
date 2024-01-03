import 'dart:io';

void main() {
  bool flag = true;
  var myList = [];
  print("How many tasks do you want to do : \n");
  int numberOfTask = int.parse(stdin.readLineSync()!);

  print("Enter your tasks to do: \n ");
  for (int i = 0; i < numberOfTask; i++) {
    var taskToDo = stdin.readLineSync();
    myList.add(taskToDo);
  }

  do {
    print("What do you want \n");
    print("1. Add task");
    print("2. Edit task");
    print("3. Delete task");
    print("4. complete task");
    print("5. Exit");
    print("Write down the number of your choice: \n ");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        {
          // to add task
          print("Enter the task to add: ");
          var newTask = stdin.readLineSync();
          myList.add(newTask);
          print('\n');
          print("****** TO DO TASK FOR TODAY ****** ");
          for (int i = 0; i < myList.length; i++) {
            print(" ○ ${(i + 1)}  ${myList[i]}  ");
          }
        }
        break;

      case 2:
        {
          // to edit
          print("Which task do you want to edit? ");
          int? taskIndex = int.parse(stdin.readLineSync()!);
          --taskIndex;
          if ( taskIndex >= 0 && taskIndex < myList.length) {
            print("Write the edited task : \n");
            myList[taskIndex] = stdin.readLineSync();
          } else {
            print("Invalid task index");
          }
          print("****** TO DO TASK FOR TODAY ****** ");
          for (int i = 0; i < myList.length; i++) {
             print(" ○ ${(i + 1)}  ${myList[i]}  ");
          }
        }
        break;

      case 3:
        {
          // for delete task
          print("Which task do you want to delete? ");
          int? taskIndexToDelete = int.parse(stdin.readLineSync()!);
          --taskIndexToDelete;

          if (taskIndexToDelete >= 0 && taskIndexToDelete < myList.length) {
            myList.removeAt(taskIndexToDelete);
            numberOfTask--; // Adjust the task count
            print("Task deleted successfully.");
          } else {
            print("Invalid task index");
          }
          print("****** TO DO TASK FOR TODAY ****** \n");
          for (int i = 0; i < myList.length; i++) {
             print(" ○ ${(i + 1)}  ${myList[i]}  ");
          }
          print("\n");
        }
        break;
    
    case 4 :{
    // to complete 
    print("which task do you completed ? \n");
    int? compl = int.parse(stdin.readLineSync()!);
    --compl;
     print("****** TO DO TASK FOR TODAY ****** ");
    for (int i = 0; i < myList.length; i++) {
        if (i==compl){
        print(" ✓ ${(i + 1)}  ${myList[i]}  \n");
        }
        else {
            print(" ○ ${(i + 1)}  ${myList[i]}  \n");
        }
        print("Good Job \n");
        }
          }
       break;

      case 5:
        {
        // to Exit 
          print("****** TO DO TASK FOR TODAY ****** ");
          for (int i = 0; i < myList.length; i++) {
             print(" ○ ${(i + 1)}  ${myList[i]}  ");
          }
          print("     That is all for today's tasks.\nThank you for using our app. Have a good day 😊💜 \n ");
          flag = false;
        }
        break;

      default:
        {
          print("Invalid choice");
        }
    }
  } while (flag);
}
