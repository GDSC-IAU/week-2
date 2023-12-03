import "task.dart";
class TaskList
{
  List<Task> tasks = [];
  TaskList();

  void addTask(String p_title, String p_description)
  {
    tasks.add(Task(id : tasks.length,title: p_title, description: p_description));
  }

  void editTaskTitle(int id, String newTitle)
  {

  }

  void editTaskDescription(int id, String newDescription)
  {

  }

  void editTaskStatus(int id)
  {

  }

  void deleteTask(int id)
  {
    tasks.removeAt(id);
    for (int i = id; i < tasks.length; i++)
    {
      tasks[i].id--;
    }
  }

  @override
  String toString()
  {
    String result = "";
    for (Task task in tasks)
    {
      result += "============================\n";
      result += "Task ID: ${task.id+1}\n";
      result += "Task Title: ${task.title}\n";
      result += "Task Description: ${task.description}\n";
      result += "Completed: ${task.isComplete ? "Yes" : "No"}\n";
      result += "============================\n";
    }
    return result;
  }
}