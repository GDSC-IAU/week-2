import "dart:io";
import "task_list.dart";
import "task.dart";

int takeNumberInput(String prompt)
{
  bool validInput = false;
  int input = -1;

  while (!validInput)
  {
    try
    {
      stdout.write(prompt);
      input = int.parse(stdin.readLineSync()!);
      validInput = true;
    }
    catch (e)
    {
      print("Please type a valid number.");
    }
  }

  return input;
}

int getTaskFromNumberInput(TaskList list, String prompt)
{
  Task? task;
  bool validInput = false;
  while (!validInput)
  {
    try
    {
      int input = takeNumberInput(prompt)-1;
      task = list.tasks[input];
      validInput = true;
    }
    catch (e)
    {
      print("Please type a valid task ID.");
    }
  }

  return task!.id;
}

bool takeYesOrNoInput(String prompt)
{
  bool choice = false;
  bool validInput = false;
  while (!validInput)
  {
    String input = takeStringInput(prompt);
    try
    {
      switch(input[0])
      {
        case ('Y' || 'y'):
          choice = true;
          validInput = true;
          break;
        case ('N' || 'n'):
          validInput = true;
          break;
        default:
          print("Type 'Y' to confirm the operation, and 'N' to cancel it.");
          break;
      }
    } catch (e) // incase input is blank (input[0] does not exist)
    {
        print("Type 'Y' to confirm the operation, and 'N' to cancel it.");
    }
  }

  return choice;
}

String takeStringInput(String prompt)
{
  stdout.write(prompt);
  return stdin.readLineSync()!;
}