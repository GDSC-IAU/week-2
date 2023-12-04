class Task 
{
  int id;
  String title;
  String description;
  bool isComplete;

  Task({this.id = -1, required this.title, required this.description, this.isComplete = false});

  void editTaskTitle(String newTitle)
  {
    title = newTitle;
  }

  void editTaskDescription(String newDescription)
  {
    description = newDescription;
  }

  void editTaskStatus()
  {
    isComplete = !isComplete;
  }


  @override
  String toString()
  {
    String result = "";
    {
      result += "============================\n";
      result += "Task ${id+1}: "; // The menu displays task IDs incremented by 1, this is so task IDs in the display start from 1 rather than 0.
      result += "${title}\n";
      result += "Description: ${description}\n";
      result += "${isComplete ? "Completed" : "Incomplete"}\n";
    }
    return result;
  }
}