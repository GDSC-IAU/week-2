// void main() {
//   int age = 30;
//   String name = 'John';
//   bool isStudent = true;
//   List<String> fruits = ['apple', 'banana', 'cherry'];

//   print('Age: $age');
//   print('Name: $name');
//   print('Is Student: $isStudent');
//   print('Fruits: $fruits');
// }

void main() {
  try {
    // ~/ integer divison like // in python
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print('An error occurred: $e');
  }
}
