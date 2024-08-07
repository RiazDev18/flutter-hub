import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_push_pop/pages/about.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Main Screen"),
          ElevatedButton(onPressed: change, child:Text("Go"))
        ],
      ),
    );
  }
  void change()
  {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) =>
      about())
    );
  }
}