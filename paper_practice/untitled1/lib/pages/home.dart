import 'dart:js';

import 'package:flutter/material.dart';

import 'about.dart';

class home extends StatelessWidget
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
        Text('Home Page'),
    ElevatedButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
        return about();
      }
      )
      );
    }, child: Text('Push')
    )
    ],
    )
    );

  }
}