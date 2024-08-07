 import 'package:flutter/material.dart';

void main()
{
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
        ),
        home: home(),
    );
  }
}
class home extends StatelessWidget{
@override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'home',
                  icon: Icon(Icons.abc_sharp),
                ),
                Tab(
                  text: 'About',
                  icon: Icon(Icons.abc_sharp),
                ),Tab(
                  text: 'Setting',
                  icon: Icon(Icons.abc_sharp),
                ),
              ],
            ),
          ),
           body: TabBarView(
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.yellow,
              ),

            ],
          ),
        )
    );
  }
}