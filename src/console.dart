import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync(
    encoding: Encoding.getByName("UTF-8")!,
  );

  print(name);
}
