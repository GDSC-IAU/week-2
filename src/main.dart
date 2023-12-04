import 'application.dart';
void main(List<String> args) 
{
  // Initialization
  Application app = Application();
  print ("\nHello, welcome to Dart task manager!");

  // App loop
  while (app.running)
  {
    app.printMainMenu();
  }

  // Exit
  print ("Thank you for using our service. Exitting now.\n");
}
