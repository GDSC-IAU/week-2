import 'task.dart';

void main() {
  // refer to back commits to see what happend here.
  Task groceriesTask = Task(
    id: 1,
    title: 'Buy groceries',
    description: 'Buy milk, eggs, and bread',
    isCompleted: false,
  );

  Task readTask = Task(
    id: 2,
    title: 'Read a book',
    description: 'Read "The Catcher in the Rye"',
    isCompleted: true,
  );

  Task emptyTask = Task();

  print(
    'Task 1: ${groceriesTask.title}, Completed: ${groceriesTask.isCompleted}',
  );

  print(
    'Task 2: ${readTask.title}, Completed: ${readTask.isCompleted}',
  );

  print(
    'Task 2: ${emptyTask.title}, Completed: ${emptyTask.isCompleted}',
  );
}
