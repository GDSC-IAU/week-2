import 'dart:io';
void main (){

  var myList= [];
  print(myList);
  print("Enter your task for to do : \n ");
  var task_toDo =stdin.readLineSync();

  print("what do you want \n");
  print("4. Edit ");
  print("writwe down the number of your chose : \n ");
  // ignore: unused_local_variable
  int y=stdin.readByteSync();
  switch (y){
    case 1 :{
  // to add task 
  myList.add(task_toDo);
  print('\n');}
  break ;
  case 2 :{
  // to delet

  // to edit 
  print("What task you want to edit ? ");
  var task_edit =stdin.readLineSync();
  // ignore: unused_local_variable
  int x= int.parse(task_edit!);
  --x;
  print("write the edit task : \n");
  myList[x]= stdin.readLineSync() as List;
  }
  break ;

  }

}