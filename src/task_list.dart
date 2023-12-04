import "task.dart";
class TaskList
{
  List<Task> tasks = [];
  TaskList();

  void addTask(String p_title, String p_description)
  {
    tasks.add(Task(id : tasks.length,title: p_title, description: p_description)); // Task ID corresponds to its index in the list
  }

  void deleteTask(int id)
  {
    tasks.removeAt(id);
    for (int i = id; i < tasks.length; i++)
    {
      tasks[i].id--; // This is to make sure each ID in the task list corresponds to its index
    }
  }

  @override
  String toString()
  {
    String result = "";
    for (Task task in tasks)
    {
      result += task.toString();
    }
    return result;
  }
}