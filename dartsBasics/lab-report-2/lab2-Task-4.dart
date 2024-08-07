import 'dart:io';
// int addition(int num1 , int num2)
// {
// return num1+num2;
// }
// int subract(int num1,int num2){
//   return num1-num2;
// }
// int multiply(int num1,int num2){
//   return num1*num2;
// }
// double divide(int num1,int num2){
//   return num1/num2;
// }
int main(){

// print("Enter your 1st number: ");
// int num1 = int.parse(stdin.readLineSync()!);
// print("Enter your 2nd number: ");
// int num2 = int.parse(stdin.readLineSync()!);
// print("1 : Addition");
// print("2 : Subtraction");
// print("3 : Multiplication");
// print("4 : Division");
// int choice = int.parse(stdin.readLineSync()!);

// if (choice == 1) 
// {
//  print(addition(num1, num2)) ;
// }
// if (choice == 2 ) 
// {
//   print(subract(num1, num2));
// }
// if (choice == 3) 
// {
//   print(multiply(num1, num2));
// }
// if (choice == 4) 
// {
//   print(divide(num1, num2));
// }

print("Enter your 1st number: ");
int num1 = int.parse(stdin.readLineSync()!);
print("Enter your 2nd number: ");
int num2 = int.parse(stdin.readLineSync()!);

print("+: Addition");
print("- : Subtraction");
print("* : Multiplication");
print("/ : Division");
print("Enter the Operator");
String choice = stdin.readLineSync()!;

switch (choice) {
  case '+':  case 'Addition':
    print("sum = ${num1+num2}");
    break;
  case '-': case 'Subtraction':
    print("Difference = ${num1-num2}");
    break;
  case '*': case 'Multiplication':
    print("Product = ${num1*num2}");
    break;
  case '/': case 'Division':
    print("quotient = ${num1/num2}");
    break;

  default:
  print("Enter valid Operator");
}

return 0;
}