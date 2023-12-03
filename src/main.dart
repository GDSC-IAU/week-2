import 'application.dart';
void main(List<String> args) 
{
  Application app = Application();
  
  while (app.running)
  {
    app.printMainMenu();
  }

}
