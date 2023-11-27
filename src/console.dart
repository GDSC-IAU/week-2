import 'dart:io';

void main() {
  // refer to back commits to see what happend here.

  stdout.write('Enter your age: ');
  // tryParse when error happens it will return null otherwise the user input
  int? age = int.tryParse(stdin.readLineSync()!) ?? 0;
  // ?? tells dart if the left operand is null then use this value (right operand) 
  
  print("Your age is: $age");
}
