class Task 
{
  int id;
  String title;
  String description;
  bool isComplete;

  Task({this.id = -1, required this.title, required this.description, this.isComplete = false});

  @override
  String toString()
  {
    String result = "";
    {
      result += "============================\n";
      result += "Task ID: ${id+1}\n";
      result += "Task Title: ${title}\n";
      result += "Task Description: ${description}\n";
      result += "Completed: ${isComplete ? "Yes" : "No"}\n";
      result += "============================\n";
    }
    return result;
  }
}