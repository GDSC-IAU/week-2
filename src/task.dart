
class Task{
   int id;
  String title;
  String description;
  bool isCompleted;

 Task({
    this.id = -1,
    required this.title,
    required this.description,
    this.isCompleted = false
});
    
}