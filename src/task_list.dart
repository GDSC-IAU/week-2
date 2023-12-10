// ignore: unused_import
import "main.dart";
import 'task.dart';

class TaskList{
  List<Task> _tasks = [];

  int get length => _tasks.length;
  
  void addTask(String title, String description){
    _tasks.add(Task(
      id: _tasks.length,
      title: title,
      description: description,

    ));
  }
  @override
String toString() {
  String result = "";
  for (var task in _tasks) {
      result += "==========================================================\n";
      result += "Task ID: ${task.id}\n";
      result += "Task Title: ${task.title}\n";
      result += "Task description: ${task.description}\n";
      result += "Is completed: ${task.isCompleted ? "Yes" : "No"}\n";
      result += "==========================================================\n";  
  }
  return result;
}

  void editTask(int index, String newTitle){
    if(index < 0 || index >= _tasks.length){
      throw ArgumentError("Invalid task index.");
    }
    _tasks[index].title = newTitle;
  }

  void deleteTask(int index){
    if(index < 0 || index >= _tasks.length){
      throw ArgumentError("Invalid task index.");
    }
    _tasks.removeAt(index);
  }

  void markTaskAsCompleted(int index){
    if(index < 0 || index >= _tasks.length){
      throw ArgumentError("Invalid task index.");
    }
    _tasks[index].isCompleted = true;
  }

  void printTasks() {
    print(toString());
  }

}
