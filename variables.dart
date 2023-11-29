
import 'task.dart';
void main(){

task task1 = task(1, 'Buy groceries', 'Buy milk, eggs, and bread', false);
task task2 = task(2, 'Read a book', 'Read "The Catcher in the Rye"', true);
task task3 = task.create();

// Print task properties
print('Task 1: ${task1.title}, Completed: ${task1.IsCompleted}');
print('Task 2: ${task2.title}, Completed: ${task2.IsCompleted}');
print('Task 3: ${task3.title}, Completed: ${task3.IsCompleted}');

// declare variables
String name="moamen";
int age=20;
double weight=57.5;
dynamic fullname="moamen hicham rabah";
bool active= true;
int? imnull;

// error handling

try {
    int result = 10 ~/ 0; // Division by zero to trigger an error
    print('Result: $result');
  } 
catch (a) {
    print('An error occurred: $a');
  }

// print variables

print("Student username: $name");
print("full name: $fullname");
print("Student age: $age");
print("weight: $weight");
print("active: $active");
print(imnull);




}
