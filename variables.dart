import 'task.dart';

void main() {
  //declare and initialize variables

  int number = 50;
  String name = "Talyia";
  bool isSmart = true;
  List<String> colors = ["Red", "Blue", "Pink", "Purple"];
  List<Map<int, String>> id_name = [
    {1: "Talyia"},
    {2: "Ryam"}
  ];

  print('Number: $number');
  print('Name: $name');
  print('Smart?: $isSmart');
  print('Color: $colors');
  print('Id with name: $id_name');

//Error Handling

  try {
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print("An error occurred: $e");
  }

  //instances of Task class

  Task task1 = Task(1, 'Submit Project', 'use github to pull request', false);
  Task task2 = Task(2, 'Read a Book', 'Read "Shatter Me"', true);

  print('Task 1: ${task1.title}, Completed: ${task1.isCompleted}');
  print('Task 2: ${task2.title}, Completed: ${task2.isCompleted}');
}
