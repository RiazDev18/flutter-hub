import 'package:flutter/material.dart';
 void main()
 {
   runApp(myApp());
 }
class myApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
  return MaterialApp(
    home: myPage(),
  );
  }
}
class myPage extends StatefulWidget{
  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
   TextEditingController tcnum1 = TextEditingController();

   TextEditingController tcnum2 = TextEditingController();

   var sum = 0;

   @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Text Image buttons"),
      backgroundColor: Colors.cyan,
    ),
    body: Column(
      children: [
        Text("PRACTICE"),
        Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/img2.jpeg')),
        TextField(controller: tcnum1,),
        TextField(controller: tcnum2,),
        ElevatedButton(onPressed: add, child: Text('Add'),
        ),
        Text('$sum')
      ],
    ),
  );
  }

  void add()
  {
    var a = int.parse(tcnum1.text);
    var b = int.parse(tcnum2.text);

    tcnum1.clear();
    tcnum2.clear();

    sum = a + b;
    setState(() {

    });
  }
}