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
    int input = getNumberInput("Please select a service (type a number): ");
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
        if (getYesOrNoInput("Exit the app? (Y/N): ")) 
        {
          running = false;
          break;
        }

        print("");
        break;

      default:
        // Invalid number; Ask again
        print("\nThat service does not exist. Please type a number between 1 and 4.");
        parseServiceType();
    }
  }

  void addTask()
  {
    print ("\nAdding Task...");
   
    String title = getStringInput("New Task Title: ");
    String description = getStringInput("New Task Description: ");
    
    list.addTask(title, description);
    print ("Task successfully added.\n");
  }

  void editTask()
  {
    if (list.tasks.length == 0)
    {
      getStringInput("\nThere are no tasks to edit, try adding some. Press enter to continue.");
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
    int serviceInput = getNumberInput("");
    switch (serviceInput)
    {
      case 1:
        // Edit task title
        print("Current task title: ${list.tasks[taskID].title}");
        String newTitle = getStringInput("New task title: ");
        list.tasks[taskID].editTaskTitle(newTitle);
        getStringInput("Task title changeed successfully. Press enter to continue.");
        break;

      case 2:
        // Edit task description
        print("Current task description: ${list.tasks[taskID].description}");
        String newDescription = getStringInput("New task description: ");
        list.tasks[taskID].editTaskDescription(newDescription);
        getStringInput("Task description changeed successfully. Press enter to continue. ");
        break;

      case 3:
        // Edit task completion status
        print ("Task status: ${(list.tasks[taskID].isComplete) ? "Complete" : "Incomplete"}");
        if (getYesOrNoInput("Mark this task as ${(!list.tasks[taskID].isComplete) ? "Complete" : "Incomplete"}? (Y/N): "))
        {
          list.tasks[taskID].editTaskStatus();
          getStringInput("Task: ${list.tasks[taskID].title} marked as ${(list.tasks[taskID].isComplete) ? "Complete" : "Incomplete"}. Press enter to continue.");
          break;
        }
        stdout.write("Select what you would like to edit about this task: ");
        parseEditType(taskID);
        break;

      case 4:
        // Cancel operation
        if (getYesOrNoInput("Cancel this operation? (Y/N): ")) 
        {
          getStringInput("Operation cancelled. Press enter to continue.");
          print("");
          break;
        }
        stdout.write("Select what you would like to edit about this task: ");
        parseEditType(taskID);
        break;

      default:
        // Invalid input; Ask again
        stdout.write("\nPlease type a number between 1 and 4: ");
        parseEditType(taskID);
    }
  }


  void deleteTask()
  {
    if (list.tasks.length == 0)
    {
      getStringInput("\nThere are no tasks to delete, try adding some. Press enter to continue.");
      return;
    }
    print("\n");
    printTaskMenu();
    int id = getTaskFromNumberInput(list, "Select a task to delete (type task ID to select task): ");
    print("\nSelected task: ${list.tasks[id].title}");
    
    if (!getYesOrNoInput("Are you sure you want to delete this task? (Y/N): ")) 
    {
      getStringInput("Operation cancelled. Press enter to continue. ");
      return;
    }
    
    list.deleteTask(id);
    getStringInput("Task successfully deleted. Press enter to continue. ");
  }

  void printTaskMenu()
  {
    print (list.toString());
  }
}


