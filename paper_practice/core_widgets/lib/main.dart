
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(app());
}
class app extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core widgets',
      home: myHomePage(),
    );
  }
}
class myHomePage extends StatefulWidget
{
  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  String? txt;
TextEditingController tc1 = TextEditingController();
TextEditingController tc2 = TextEditingController();
 int x = 0;
 int y = 0;
 int result = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Core widgets'),
      ),
      body: Column(
          children: [
            Center(
                child: Text("This is text wideget",
                  style: TextStyle(
                      fontWeight:FontWeight.bold,color: Colors.red,backgroundColor: Colors.cyan),
                ),
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/cat.jpeg'),
            ),
            ElevatedButton(onPressed: Clicked, child: Text('Submit')),
            Text("Add Numbers"),
            Container(
              width: 400,
                child: TextField(controller: tc1,decoration: InputDecoration(hintText: 'Enter First Value: '))
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 400,
                child: TextField(controller: tc2,decoration: InputDecoration(hintText: 'Enter 2nd Value: '),)
            ),
            ElevatedButton(onPressed: Addition, child: Text('Add')),
            Text('Result : $result'),
          ],
      ),
    );
  }
  void Clicked()
  {
   print('Clicked');
  }
  void Addition()
  {
    x = int.parse(tc1.text);
    y = int.parse(tc2.text);
    result = x + y;
    setState(() {

    });
  }
}