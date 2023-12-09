// Your job is to create a simple task list app using Dart. The app should allow users to add, edit, and delete tasks. The app should also allow users to mark tasks as completed. The app should be able to handle errors and display error messages to the user.


class TaskInfo{
  String Num = '';
  String Name = '';
  String Description = '';
  bool CompletedOrNot = false;

  TaskInfo(this.Num,this.Name,this.Description,this.CompletedOrNot);

   void Display() {
    print("~~~~~~~~~~~~\n");
    print("Task # $Num \n");
    print("Task Name: $Name\n");
    print("Task Description: $Description\n");
    print("Completed or not? ${CompletedOrNot ? "Completed" : "Not completed"}\n");
  }

  // String Display(){
  //   return "~~~~~~~~~~~~\nTask # $Num \nTask Name: $Name\nTask Description: $Description\nCompleted or not? ${ComplitedOrNot ? "Completed" : "Not completed"}";
  // }
  
}




