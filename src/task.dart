class Task {
  int? id;
  String? title;
  String? description;
  bool? isDone;

  void markAsDone() {
    isDone = true;
  }

 
  Task({
    this.id = -1,
     this.title,
     this.description,
    this.isDone = false,
  });
}
