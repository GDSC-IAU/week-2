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
    print("\n");
    print("1. Add Task\n");
    print("2. Edit Task\n");
    print("3. Delete Task\n");
    print("4. Exit\n");
    parseServiceType();
  }

  void parseServiceType()
  {
    print("Please select a service (type a number): ");
    int input = takeNumberInput();
    switch (input)
    {
      case 1:
        // Add task
        list.addTask("example title", "example description");
        break;

      case 2:
        // Edit task
        break;

      case 3:
        // Delete Task
        break;

      case 4:
        // Exit app
        running = false;
        break;

      default:
        // Invalid number; Ask again
        parseServiceType();
    }
}

  void printTaskMenu()
  {
    print (list.toString());
  }
}


int takeNumberInput()
{
  bool validInput = false;
  int input = -1;

  while (!validInput)
  {
    try
    {
      input = int.parse(stdin.readLineSync()!);
      validInput = true;
    }
    catch (e)
    {
      print ("Please type a valid number: ");
    }
  }

  return input;
}