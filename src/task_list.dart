import "task.dart";
class TaskList
{
  List<Task> tasks = [];
  TaskList();

  void addTask(String p_title, String p_description)
  {
    tasks.add(Task(id : tasks.length,title: p_title, description: p_description));
  }

  void editTaskTitle()
  {

  }

  void editTaskDescription()
  {

  }

  void editTaskStatus()
  {
    
  }

  void deleteTask()
  {

  }

  @override
  String toString()
  {
    String result = "";
    for (Task task in tasks)
    {
      result += "============================\n";
      result += "Task ID: ${task.id}\n";
      result += "Task Title: ${task.title}\n";
      result += "Task Description: ${task.description}\n";
      result += "Completed: ${task.isComplete ? "Yes" : "No"}\n";
      result += "============================\n";
    }
    return result;
  }
}