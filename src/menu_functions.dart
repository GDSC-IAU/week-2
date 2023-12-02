import "dart:io";


void printMainMenu()
{

}

int takeInput()
{
  bool validInput = false;
  int input = -1;
  print("Select a number");

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