import 'dart:io';
void main(){
 stdout.write("Enter Any String: ");
 String  text = stdin.readLineSync()!;
   String reverseText = '';
  for (var i = text.length - 1; i >= 0; i--) {
  reverseText += text[i];
 }
 if (text == reverseText) {
   print("palindrome");
 }
 else{
     print("it is not a palindrome");
 }
}