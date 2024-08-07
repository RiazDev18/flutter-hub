
void main(){
  // dynamic is used to give anything in the value it can be int, double or string
  Map<String, dynamic> name = {'Riaz': 23.34, "Hassan": 'Khan'};

  // you can also access individual key in the map
  print(name['Riaz']);
  // or you can access in this way with loop
  for (var key in name.entries) {
    print(key);
  }

  // List program
  List marks = [87, 55, 67, 90, 10];

  // you can access list this way without loop difference will be in the output
  print(marks);

  // or you can access every item individually
  for (var mark in marks) {
    print(mark);
  }

  int num = 37;
  for (var i = 0; i < marks.length; i++) {
    if (marks[i] == 67) {
      marks[i] = num;
    }
  }
print("After change");
for (var mark in marks) {
    print(mark);
  }

}