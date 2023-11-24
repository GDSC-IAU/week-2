
import 'dart:io'; // for take input from the user

// create a class 
class Student {
  String ?  name;  // here we add ? mark to let the varible be null , becuse if i let it empty without any initialzition it will give me an erroe !! 
  int ? age1  ; 
  int ? level  ; 
  // create a constructor 
  Student(String name , int age1 , int leve )
  {
    this.name=name;
    this.age1=age1;
    level=leve;
  }
}

void main (){
 // declares and initializes different types of variables 
print('********* HI , here we initialize different types of varibles *********');
 String fname = "Hawra";
 String mname = "Faris";
 String lname = "Alaradi";
int age = 20 ; 
print('my name is $fname $mname $lname and my age is $age years old');
List l = ["Ali","Hussein","Hadi"];
print('and i have a three brothers thire names are $l');
// Error Handling using try and catch 
print(' ********* and here we use try and catch ********* ');
String uinput = '3,6';
try { 
double number = double.parse(uinput);
print('the square of your number is ${number*number}');
} on FormatException catch (e) {
  print('you have enterd an invalid number');
  print(e);
}
// create a object from student calss 
print('********* and here we create a object from Student class ********* ');
final student1 = new Student('Ali',25,9);
print('The info of student1 is : his/her name is  ${student1.name} his/her age is ${student1.age1} his/her leve is ${student1.level}');

print('********* and here we create a to do list  ********* ');

List toDo = ['study','do HW'];
int ? choice ;
do { // strat of do while loop 
     print('HI ,\r\n prese 1 : if u want to add new task \r\n Prese 2 : if u want to delete a tsk \r\n Prese 3 : to disply the to do list \r\n Prese 4 to update a task \r\n Prese 5 : to quit  ');
     choice = int.parse(stdin.readLineSync()!);
     switch(choice)
     { // start of switch 
      case 1 : { print('enter the task that u want to add ');
                 String ? task = stdin.readLineSync();
                 toDo.add(task); }
      break;
      case 2 : {print('enter the task that u want to delete ');
               String ? key = stdin.readLineSync();
               for(int i=0 ; i<toDo.length ; i++)
               {
               if(key==toDo[i])
               toDo.remove(key);
               } }
      break;
      case 3 : {print(toDo);}
      break;
      case 4 : {print('enter the tak that u want to update ');
                 String ? key = stdin.readLineSync();
               for(int i=0 ; i<toDo.length ; i++)
               {
               if(key==toDo[i])
               toDo.remove(key);
               }
               print('enter your update');
               String ? task = stdin.readLineSync();
                 toDo.add(task); }
      break;
      default : {print('Plese enter a number between 1 to 4');}
      break;
     } // end of switch 
} // end of do wile 
 while(choice!=5);
} // end of main function 