class Task 
{
  int id;
  String title;
  String description;
  bool isComplete;

  Task({this.id = -1, required this.title, required this.description, this.isComplete = false});
}