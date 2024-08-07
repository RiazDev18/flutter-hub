import 'dart:io';
void main()
{
  
  print("Enter 1st Number : ");
  int num1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number : ");
  int num2 = int.parse(stdin.readLineSync()!);
  print("Enter 3rd Number : ");
  int num3 = int.parse(stdin.readLineSync()!);

  average(num1, num2 ,num3);
}

average(int num1,int num2, int num3){

    double average = (num1+num2+num3)/3;
print("Average is  : $average");
  }