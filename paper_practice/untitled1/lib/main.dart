
import 'package:flutter/material.dart';
import 'package:untitled1/pages/home.dart';

void main()
{
  runApp(app());
}
class app extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataBase Connection',
      home: home(),
    );
  }
}
