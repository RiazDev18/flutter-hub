import 'dart:io';
void main()
{
  
  print("Enter 1st Number : ");
  int num1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number : ");
  int num2 = int.parse(stdin.readLineSync()!);
  print("Enter 3rd Number : ");
  int num3 = int.parse(stdin.readLineSync()!);

  myfunc(num1, num2 ,num3);
}

myfunc(int num1,int num2 , int num3){

    int sum = num1+num2 + num3;
print("sum : $sum");
  }