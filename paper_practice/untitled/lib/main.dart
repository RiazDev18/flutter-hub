
import 'package:flutter/material.dart';
import 'package:untitled/pages/about.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/setting.dart';


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
  List Pages = [home(),about(),setting()];

  var selectedPage = 0;

  void navigate(int index)
  {
    selectedPage = index;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body:Pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
        onTap: navigate,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.abc_sharp),
            label: 'about'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'about'
        ),
      ],
    ),
    );
  }
}