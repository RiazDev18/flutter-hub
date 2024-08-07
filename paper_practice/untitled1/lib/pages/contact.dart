import 'package:flutter/material.dart';
class about extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text('PushPop'),
        ),
        body: Column(
          children: [
            Text('Contact'),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(MaterialPageRoute(builder: (BuildContext context){
                return about();
              }
              )
              );
            }, child: Text('POP')
            )
          ],
        )
    );
  }
}