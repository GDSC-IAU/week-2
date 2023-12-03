import "dart:io";
import "task_list.dart";
import "task.dart";

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
      print ("\nPlease type a valid number: ");
    }
  }

  return input;
}

int getTaskFromNumberInput(TaskList list)
{
  Task? task;
  bool validInput = false;
  while (!validInput)
  {
    try
    {
      int input = takeNumberInput()-1;
      task = list.tasks[input];
      validInput = true;
    }
    catch (e)
    {
      print ("Please type a valid task ID: ");
    }
  }

  return task!.id;
}

bool takeYesOrNoInput()
{
  bool choice = false;
  bool validInput = false;
  while (!validInput)
  {
    String input = takeStringInput();
    try
    {
      switch(input[0])
      {
        case 'Y':
          choice = true;
          validInput = true;
          break;
        case 'N':
          validInput = true;
          break;
        default:
          print("Type 'Y' to confirm the operation, and 'N' to cancel it: ");
          break;
      }
    } catch (e)
    {
        print("Type 'Y' to confirm the operation, and 'N' to cancel it: ");
    }
  }

  return choice;
}

String takeStringInput()
{
  return stdin.readLineSync()!;
}