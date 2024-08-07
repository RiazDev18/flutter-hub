import 'dart:io';
void main()
{
   print("Enter your Marks");
   int marks = int.parse(stdin.readLineSync()!);
  if (marks >= 90) {
    print("Grade : A");
  }
    if (marks >= 80 && marks < 90) {
    print("Grade : B");
  }
    if (marks >= 70 && marks<80) {
    print("Grade : C");
  }
    if (marks < 70) {
    print("Fail");
  }
}