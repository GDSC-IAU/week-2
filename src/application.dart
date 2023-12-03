import "utils.dart";
import "dart:io";
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
    parseServiceType();
  }

  void parseServiceType()
  {
    int input = takeNumberInput("Please select a service (type a number): ");
    switch (input)
    {
      case 1:
        // Add task
        addTask();
        break;

      case 2:
        // Edit task
        editTask();
        break;

      case 3:
        // Delete Task
        deleteTask();
        break;

      case 4:
        // Exit app
        if (takeYesOrNoInput("Exit the app? (Y/N): ")) running = false;
        break;

      default:
        // Invalid number; Ask again
        stdout.write("Please type a valid number: ");
        parseServiceType();
    }
  }

  void addTask()
  {
    print ("\nAdding Task...");
   
    String title = takeStringInput("New Task Title: ");
    String description = takeStringInput("New Task Description: ");
    
    list.addTask(title, description);
    print ("Task successfully added.\n");
  }

  void editTask()
  {
    if (list.tasks.length == 0)
    {
      takeStringInput("There are no tasks to edit. Press enter to continue.");
      return;
    }

    print("");
    int id = getTaskFromNumberInput(list, "Select task to edit: ");
    
    print(list.tasks[id].toString());
    print("What would you like to edit about this task?");
    print("1. Task Title");
    print("2. Task Description");
    print("3. Task Completion Status");
    print("4. Cancel");

    parseEditType(id);
  }

  void parseEditType(int taskID)
  {
    int serviceInput = takeNumberInput("");
    switch (serviceInput)
    {
      case 1:
        // Edit task title
        print("Current task title: ${list.tasks[taskID].title}");
        String newTitle = takeStringInput("New task title: ");
        list.editTaskTitle(taskID, newTitle);
        takeStringInput("Task title changeed successfully. Press enter to continue. ");
        break;

      case 2:
        // Edit task description
        print("Current task description: ${list.tasks[taskID].description}");
        String newDescription = takeStringInput("New task description: ");
        list.editTaskTitle(taskID, newDescription);
        takeStringInput("Task description changeed successfully. Press enter to continue. ");
        break;

      case 3:
        // Edit task completion status
        break;

      case 4:
        // Cancel operation
        if (takeYesOrNoInput("Cancel this operation? (Y/N): ")) 
        {
          takeStringInput("Operation cancelled. Press enter to continue.");
          break;
        }
        stdout.write("Select what you would like to edit about this task: ");
        parseEditType(taskID);
        break;

      default:
        // Invalid input; Ask again
        stdout.write("Please type a valid number: ");
        parseEditType(taskID);
    }
  }


  void deleteTask()
  {
    if (list.tasks.length == 0)
    {
      takeStringInput("There are no tasks to delete. Press enter to continue.");
      return;
    }
    print("\n");
    printTaskMenu();
    int id = getTaskFromNumberInput(list, "Select a task to delete (type task ID to select task): ");
    print("\nSelected task: ${list.tasks[id].title}");
    
    if (!takeYesOrNoInput("Are you sure you want to delete this task? (Y/N): ")) 
    {
      takeStringInput("\nOperation cancelled. Press enter to continue. ");
      return;
    }
    
    list.deleteTask(id);
    takeStringInput("\nTask successfully deleted. Press enter to continue. ");
  }

  void printTaskMenu()
  {
    print (list.toString());
  }
}


