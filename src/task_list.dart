import "task.dart";
class TaskList
{
  List<Task> taskList = [];

  void addTask(String p_title, String p_description)
  {
    taskList.add(Task(title: p_title, description: p_description));
  }

  void editTask()
  {

  }

  void deleteTask()
  {
    
  }
}