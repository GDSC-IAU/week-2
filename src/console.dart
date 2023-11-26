import 'dart:io';

void main() {
  // refer to back commits to see what happend here.

  stdout.write('Enter your age: ');
  // can result in error if user put non integer
  int? age = int.parse(stdin.readLineSync()!);

  print("Your age is: $age");
}
