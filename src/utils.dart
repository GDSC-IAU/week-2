import 'dart:io';

// Print Error
void printError(String text) {
  print('\x1B[31m$text\x1B[0m\n\n');
}

// Print Success
void printSuccess(String text) {
  print('\x1B[32m$text\x1B[0m\n\n');
}

// Confirm
bool confirm(String text) {
  stdout.write("$text (y/n): ");
  String choice = stdin.readLineSync()!;
  return choice.toLowerCase() == 'y';
}

// Input a number
int inputNumber(String text) {
  int number = -2;
  stdout.write("$text: ");
  try {
    number = int.parse(stdin.readLineSync()!);
  } on FormatException {
    printError("Please Enter a Number");
    return -2;
  }

  return number;
}
