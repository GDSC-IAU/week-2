class task {
  static int nextid = 0;
  int? id;
  String? title;
  String? description;
  bool? IsCompleted;
  
  task(this.id, this.title, this.description, this.IsCompleted);
  
  task.create() {
    id = nextid++;
    title = '';
    description = '';
    IsCompleted = false;
  }
 
}