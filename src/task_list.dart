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
    tasks[id].title = newTitle;
  }

  void editTaskDescription(int id, String newDescription)
  {
    tasks[id].description = newDescription;
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
      result += task.toString();
    }
    return result;
  }
}