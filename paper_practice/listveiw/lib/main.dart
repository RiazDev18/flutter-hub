
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
      title: 'ListVeiw',
      home: myHomePage(),
    );
  }
}
class myHomePage extends StatelessWidget
{
  List name = ['Riaz','Najib','bashko','munazza'];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListVeiw'),
      ),
      body:  GridView.builder(
        itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
          itemBuilder: (context ,index)
          {
            return Container(
              color:Colors.green ,
              margin: EdgeInsets.all(10),
              child: Text('$index ${name[index]}')
            );
          }
      ),
    );
  }
}