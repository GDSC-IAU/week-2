import "dart:io";
import "task_list.dart";
import "task.dart";

// useful functions

int getNumberInput(String prompt)
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
      print("\nPlease type a valid number.");
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
      int input = getNumberInput(prompt)-1; // Menu displays IDs incremented by 1, so we need to compensate by subtracting 1 from user input to get real ID
      task = list.tasks[input];
      validInput = true;
    }
    catch (e)
    {
      print("\nThat task does not exist. Please type a valid task ID.");
    }
  }

  return task!.id;
}

bool getYesOrNoInput(String prompt)
{
  bool choice = false;
  bool validInput = false;
  while (!validInput)
  {
    String? input = getStringInput(prompt);

    if (input.length <= 0) // user did not provide input 
    {
      print("Type 'Y' to confirm the operation, and 'N' to cancel it.");
      continue;
    }
    
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
     
  }

  return choice;
}

String getStringInput(String prompt)
{
  stdout.write(prompt);
  String input = stdin.readLineSync()!;
  print(""); // line break
  return input;
}