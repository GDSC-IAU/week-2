void main() {
  int number = 50;
  String name = "Talyia";
  bool isSmart = true;
  List<String> colors = ["Red", "Blue", "Pink", "Purple"];
  List<Map<int, String>> id_name = [
    {1: "Talyia"},
    {2: "Ryam"}
  ];

  try {
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print("An error occurred: $e");
  }

  print('Number: $number');
  print('Name: $name');
  print('Smart?: $isSmart');
  print('Color: $colors');
  print('Id with name: $id_name');
}
