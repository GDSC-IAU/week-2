import "task.dart";
import "utils.dart";
import "task_list.dart";

class Application
{
  bool running = true;
  TaskList list = TaskList();
  Application({this.running = true});

  void printMainMenu()
  {
    printTaskMenu();
    print("1. Add Task");
    print("2. Edit Task");
    print("3. Delete Task");
    print("4. Exit");
    print("Please select a service (type a number): ");
    parseServiceType();
  }

  void parseServiceType()
  {
    int input = takeNumberInput();
    switch (input)
    {
      case 1:
        // Add task
        addTask();
        break;

      case 2:
        // Edit task
        break;

      case 3:
        // Delete Task
        deleteTask();
        break;

      case 4:
        // Exit app
        running = false;
        break;

      default:
        // Invalid number; Ask again
        print ("Please type a valid number: ");
        parseServiceType();
    }
  }

  void addTask()
  {
    print ("Adding Task");
   
    print ("New Task Title: ");
    String title = takeStringInput();
    print ("New Task Description: ");
    String description = takeStringInput();
    
    list.addTask(title, description);
    print ("Task successfully added.\n");
  }

  void deleteTask()
  {
    if (list.tasks.length == 0)
    {
      print("There are no tasks to delete. Press anything to continue.");
      takeStringInput();
      return;
    }
    print("\n");
    printTaskMenu();
    print("Select a task to delete (type task ID to select task): ");
    int id = getTaskFromNumberInput(list);
    print("\n Selected task: ${list.tasks[id].title}");
    print("Are you sure you want to delete this task? (Y/N)");
    
    if (!takeYesOrNoInput()) 
    {
      print("Operation cancelled. Press anything to continue.");
      takeStringInput();
      return;
    }
    
    list.deleteTask(id);
    print("Task successfully deleted. Press anything to continue.\n");
    takeStringInput();
  }

  void printTaskMenu()
  {
    print (list.toString());
  }
}


