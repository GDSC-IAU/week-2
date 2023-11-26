import 'task.dart';

void main() {
  // refer to back commits to see what happend here.
  Task groceriesTask = Task(
    1,
    'Buy groceries',
    'Buy milk, eggs, and bread',
    false,
  );

  Task readTask = Task(
    2,
    'Read a book',
    'Read "The Catcher in the Rye"',
    true,
  );

  print(
    'Task 1: ${groceriesTask.title}, Completed: ${groceriesTask.isCompleted}',
  );

  print(
    'Task 2: ${readTask.title}, Completed: ${readTask.isCompleted}',
  );
}
